class TargetPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def create?
    user.present?
  end
end
