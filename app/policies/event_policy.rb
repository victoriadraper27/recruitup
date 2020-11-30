class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end



  def approve?
    owner_or_admin?
  end

  def decline?
    owner_or_admin?
  end
end
