class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end
