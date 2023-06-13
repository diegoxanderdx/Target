describe 'POST api/v1/targets', type: :request do
  let(:topic) { create(:topic) }
  let!(:create_params) do
    { 'target' => { 'title' => 'target test', 'radius' => 4, 'latitude' => 35.987,
                    'longitude' => -24.564, 'topic_id' => topic.id } }
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
        expect(response).to be_created
      end

      it 'returns the created target with all fields' do
        subject
        expect(payload).to eq(created_target.as_json)
        expect(created_target.title).to eq(created_target.title)
        expect(created_target.radius).to eq(created_target.radius)
        expect(created_target.latitude).to eq(created_target.latitude)
        expect(created_target.longitude).to eq(created_target.longitude)
        expect(created_target.topic_id).to eq(created_target.topic_id)
      end
    end
  end

  context 'with not user logged in' do
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
