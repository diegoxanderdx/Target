class TargetPolicy < ApplicationPolicy
<<<<<<< HEAD
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all if user.present?
    end
  end

  def index?
    user.present?
  end

=======
>>>>>>> RSLC-2
  def create?
    user.present?
  end
end
