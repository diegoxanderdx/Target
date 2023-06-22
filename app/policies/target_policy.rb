class TargetPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end
