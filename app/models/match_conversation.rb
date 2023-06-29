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
class MatchConversation < ApplicationRecord
  belongs_to :user1, class_name: 'User'
  belongs_to :user2, class_name: 'User'
  belongs_to :target

  validate :users_are_not_the_same

  private

  def users_are_not_the_same
    errors.add(:user2, I18n.t('model.match_conversation.errors.same_user_match')) if user1 == user2
  end
end
