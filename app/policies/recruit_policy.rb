class RecruitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def destroy?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    user == record.user || user.admin
  end
end
