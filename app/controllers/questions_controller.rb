class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def new
    @question = Question.new
    authorize @question

  end

  def index
    @questions = policy_scope(Question.where(asked: false))
  end

  def live_index
    @questions = Question.where(asked: false)
    authorize @questions
  end

  def show
    authorize @question

  end

  def edit
  end

  def destroy
    @question.destroy
    authorize @question
    ActionCable.server.broadcast("dynamic_index", {
      question: @question,
      test: "test",
      question_partial: ApplicationController.renderer.render(
              partial: "questions/question",
              locals: { question: @question, user_is_question_author: false }
        )
      })

    redirect_to(questions_path)

  end

  def create
    @question = current_user.questions.build(question_params)
    @question.save
    authorize @question
    ActionCable.server.broadcast("dynamic_index", {
      question: @question,
      question_partial: ApplicationController.renderer.render(
              partial: "questions/question",
              locals: { question: @question, user_is_question_author: false}
        ),
      })

    redirect_to questions_path
  end

  def update
    @question.update(question_params)
   ActionCable.server.broadcast("dynamic_index", {
      question: @question,
      test: "upvote",
      question_partial: ApplicationController.renderer.render(
              partial: "questions/question",
              locals: { question: @question, user_is_question_author: false }
        ),
      })
    redirect_to(questions_path)

  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    authorize @question
    ActionCable.server.broadcast("dynamic_index", {
      test: "upvote",
      question: @question,
      question_partial: ApplicationController.renderer.render(
              partial: "questions/question",
              locals: { question: @question, user_is_question_author: false }
        ),
      })
    redirect_to(questions_path)

  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
    redirect_to(questions_path)
  end

   def archive
    @question = Question.find(params[:id])
    @question.asked = true
    @question.save
    authorize @question
    redirect_to(questions_path)
  end

 private

  def question_params
    params.require(:question).permit(:title, :description, :end_date, :asked, :votes)
  end

  def set_question
    @question = Question.find(params[:id])
    authorize @question
  end



end
