# == Schema Information
#
# Table name: match_conversations
#
#  id         :bigint           not null, primary key
#  user1_id   :integer
#  user2_id   :integer
#  target_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe MatchConversation, type: :model do
  subject(:match_conversation) { build :match_conversation }

  describe 'associations' do
    it { should belong_to(:user1) }
    it { should belong_to(:user2) }
    it { should belong_to(:target) }
  end

  describe 'validations' do
    context 'when first and second user are the same' do
      let(:user)  { create(:user) }
      let(:match_conversation) { build(:match_conversation, user1_id: user.id, user2_id: user.id) }

      it 'is not valid' do
        expect(match_conversation).to_not be_valid
      end

      it 'returns error message' do
        match_conversation.valid?
        expect(match_conversation.errors[:user2]).to include(
          I18n.t('model.match_conversation.errors.same_user_match')
        )
      end
    end
  end
end
