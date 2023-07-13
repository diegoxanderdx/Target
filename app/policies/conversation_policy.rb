class ConversationPolicy < ApplicationPolicy
  def index?
    user.conversations.any?
  end
end
