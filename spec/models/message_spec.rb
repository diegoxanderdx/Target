# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  message         :string           not null
#  user_id         :bigint           not null
#  conversation_id :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#
require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { build(:message) }

  describe 'Validations' do
    it 'validate presence of required fields' do
      expect(subject).to validate_presence_of(:message)
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:conversation) }
  end
end
