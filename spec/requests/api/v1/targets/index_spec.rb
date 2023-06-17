describe 'GET api/v1/targets', type: :request do
  let!(:targets) { create_list(:target, 4) }

  context 'with user logged in' do
    let!(:user) { create(:user) }
    let!(:user_targets) { create_list(:target, 2, user:) }

    subject { get api_v1_targets_path, headers: auth_headers, as: :json }

    it 'returns a successful response' do
      subject
      expect(response).to be_successful
    end

    it 'returns all targets from current user' do
      subject
      expect(payload).not_to be_empty
      expect(payload.size).to eq(user_targets.size)
    end
  end

  context 'with user not logged in' do
    subject { get api_v1_targets_path }

    it 'returns a not authorized response' do
      subject
      expect(response).to be_unauthorized
    end
  end
end
