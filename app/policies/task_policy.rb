class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == task.user
  end

  def destroy?
    return true if user.present? && user == task.user
  end

  private

  def task
    record
  end
end