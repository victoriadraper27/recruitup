class RecruitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def create?
    true
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user.team == record.team || user.admin
  end
end
