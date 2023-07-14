RSpec.describe 'GET api/v1/conversations', type: :request do
  let!(:user) { create(:user) }
  let!(:conversation) { create_list(:conversation, 2, user1: user) }

  subject { get api_v1_conversations_path, headers: auth_headers, as: :json }

  context 'with authenticated user' do
    it 'returns a successful response' do
      subject
      expect(response).to be_successful
    end

    it 'check presence of users in the response' do
      subject
      expect(payload[0]['user1']).to be_present
      expect(payload[0]['user2']).to be_present
    end
  end

  context 'with no authenticated user' do
    subject { get api_v1_conversations_path }

    it 'returns status unauthorized' do
      subject
      expect(response).to be_unauthorized
    end
  end
end
