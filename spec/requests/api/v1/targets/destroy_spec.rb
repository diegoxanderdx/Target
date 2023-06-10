describe 'DELETE api/v1/targets/id', type: :request do
  let!(:user) { create(:user) }
  let!(:user_targets) { create_list(:target, 3, user:) }
  let!(:targets) { create_list(:target, 4) }
  let(:first_target) { user_targets.first }
  let(:id) { first_target.id }
  subject { delete api_v1_target_path(id:), headers: auth_headers, as: :json }

  it 'returns a successful response' do
    subject
    expect(response).to be_successful
  end

  it 'deletes the target' do
    expect { subject }.to change(user.targets, :count).from(3).to(2)
  end

  describe 'when the target does not belong to the logged user' do
    let(:id) { targets.first.id }

    it 'does not return a successful response' do
      subject
      expect(response).to be_not_found
    end

    it 'does not delete the target' do
      expect { subject }.not_to change { Target.count }
    end
  end
end
