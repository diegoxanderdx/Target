class TopicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all if user.present?
    end
  end
end
