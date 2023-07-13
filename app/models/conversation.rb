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
class Conversation < ApplicationRecord
  belongs_to :user1, class_name: 'User', foreign_key: 'user1', inverse_of: :conversations
  belongs_to :user2, class_name: 'User', foreign_key: 'user2', inverse_of: :conversations

  validates :user1, uniqueness: { scope: :user2 }
  validate :users_are_not_the_same

  private

  def users_are_not_the_same
    errors.add(:user2, I18n.t('model.conversation.errors.same_user')) if user1 == user2
  end
end
