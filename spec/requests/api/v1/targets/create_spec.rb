RSpec.describe 'POST /api/targets', type: :request do
  let!(:topic) { create(:topic) }
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }
  let!(:target1) do
    create(:target, topic_id: topic.id, user: user2, latitude: 37.987, longitude: -26.564)
  end
  let!(:target2) do
    create(:target, topic_id: topic.id, user: user3, latitude: 37.987, longitude: -26.564)
  end

  let(:params) do
    {
      'target' => {
        'title' => 'test',
        'radius' => 20,
        'latitude' => 37.987,
        'longitude' => -26.564,
        'topic_id' => topic.id
      }
    }
  end
  let(:created_target) { Target.last }

  subject { post api_v1_targets_path, params:, headers: auth_headers, as: :json }

  context 'with authenticated user' do
    let(:created_target) { Target.last }

    it 'returns a successful response' do
      subject
      expect(response).to be_successful
    end

    it 'creates a new target' do
      expect { subject }.to change { Target.count }.by(1)
    end

    it 'returns the created target with all fields' do
      subject
      expect(payload['title']).to eq(created_target.title)
      expect(payload['radius']).to eq(created_target.radius)
      expect(payload['latitude']).to eq(created_target.latitude)
      expect(payload['longitude']).to eq(created_target.longitude)
      expect(payload['topic_id']).to eq(created_target.topic_id)
    end

    it 'create a match' do
      expect { subject }.to change { Conversation.count }.by(2)
    end
  end

  context 'when the user has the maximum number of targets' do
    let(:user) { create(:user) }
    let!(:user_targets) { create_list(:target, 3, user:) }

    it 'does not create a target' do
      expect { subject }.not_to change { Target.count }
    end

    it 'does not return a successful response' do
      subject
      expect(response).to be_unprocessable
    end

    it 'returns an error message' do
      subject
      expect(json[:errors][:user].first).to eq(I18n.t('model.target.errors.max_targets'))
    end
  end

  context 'with authenticated user, wrong params' do
    describe 'POST create with wrong param' do
      let!(:params) do
        {
          'target' => {
            'title' => 'target test',
            'radius' => 'a string',
            'latitude' => 35.987,
            'longitude' => -24.564,
            'topic_id' => topic.id
          }
        }
      end

      it 'returns a failed response' do
        subject
        expect(response).to be_unprocessable
      end

      it 'dont create the target' do
        expect { subject }.not_to change { Target.count }
      end
    end

    describe 'POST create with blank param' do
      let!(:params) do
        {
          'target' => {
            'title' => '',
            'radius' => 4.0,
            'latitude' => 35.987,
            'longitude' => -24.564,
            'topic_id' => topic.id
          }
        }
      end

      it 'returns a failed response' do
        subject
        expect(response).to be_unprocessable
      end

      it 'dont create the target' do
        expect { subject }.not_to change { Target.count }
      end
    end
  end

  context 'with not authenticated user' do
    describe 'POST create' do
      subject { post api_v1_targets_path, params:, as: :json }

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
