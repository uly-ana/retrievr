class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end
  def destroy?
    user.present?
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end
