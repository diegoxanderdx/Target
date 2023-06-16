describe 'POST api/v1/targets', type: :request do
  let(:topic) { create(:topic) }
  let!(:create_params) do
    {
      'target' => {
        'title' => 'target test',
        'radius' => 4.0,
        'latitude' => 35.987,
        'longitude' => -24.564,
        'topic_id' => topic.id
      }
    }
  end
  let(:created_target) { Target.last }

  context 'with user logged in' do
    describe 'POST create' do
      let(:user) { create(:user) }
      subject { post api_v1_targets_path, params: create_params, headers: auth_headers, as: :json }

      it 'returns a successful response' do
        subject
        expect(response).to be_successful
      end

      it 'creates the target' do
        expect { subject }.to change(Target, :count).from(0).to(1)
      end

      it 'returns the created target with all fields' do
        subject
        expect(payload['id']).to eq(created_target.id)
        expect(payload['title']).to eq(created_target.title)
        expect(payload['radius']).to eq(created_target.radius)
        expect(payload['latitude']).to eq(created_target.latitude)
        expect(payload['longitude']).to eq(created_target.longitude)
        expect(payload['topic_id']).to eq(created_target.topic_id)
      end
    end

    context 'when the user has the maximum number of targets' do
      let(:user) { create(:user) }
      let!(:user_targets) { create_list(:target, 3, user:) }
      subject { post api_v1_targets_path, params: create_params, headers: auth_headers, as: :json }

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end

      it 'does not return a successful response' do
        subject
        expect(response).to be_bad_request
      end

      it 'returns an error message' do
        subject
        expect(json[:errors][:user].first).to eq(I18n.t('model.target.errors.invalid_amount'))
      end
    end
  end

  context 'with user not logged in' do
    describe 'POST create' do
      subject { post api_v1_targets_path, params: create_params, as: :json }

      it 'returns a not authorized response' do
        subject
        expect(response).to be_unauthorized
      end

      it 'does not create a target' do
        expect { subject }.not_to change { Target.count }
      end
    end
  end
end
