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
    user.role == "Head Coach"
  end

  def destroy?
    user.role == "Head Coach"
  end

  private

  def owner_or_admin?
    user.team == record.team
  end
end
