# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  user1      :integer          not null
#  user2      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_conversations_on_user1_and_user2  (user1,user2) UNIQUE
#
require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user) { create(:user) }
  subject { build(:conversation) }

  describe 'Validations' do
    it 'validates that user1 and user2 are not the same' do
      subject.user2 = subject.user1
      expect(subject).to be_invalid
      expect(subject.errors[:user2]).to include(I18n.t('model.conversation.errors.same_user'))
    end
  end

  describe 'Associations' do
    it { should belong_to(:user1) }
    it { should belong_to(:user2) }
  end

  it 'do not create a conversation' do
    conversation = Conversation.new(user1: user, user2: user)
    conversation.validate
    expect(conversation.errors).to be_present
  end

  it 'check error message' do
    conversation = Conversation.new(user1: user, user2: user)
    conversation.validate
    expect(conversation.errors.messages[:user2]).to include(I18n.t('model.conversation.errors.same_user'))
  end
end
