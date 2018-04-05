class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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
