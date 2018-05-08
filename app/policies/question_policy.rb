class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope
    def resolve
      scope.all
    end
  end

  def live_index?
    true
  end

def archives?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def upvote?
    true
  end

  def update?
    true
  end

   def archive?
    true
  end

end
