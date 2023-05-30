class TopicPolicy < ApplicationPolicy
  def index?
    user.present?
  end
end
