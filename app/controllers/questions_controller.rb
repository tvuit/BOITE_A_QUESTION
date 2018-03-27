class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  def new
    @question = Question.new
    authorize @question

  end

  def index
    @questions = policy_scope(Question)
  end

  def show
  end

  def edit
  end

  def destroy
    @question.destroy
    authorize @question
    redirect_to(questions_path)
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.save
    authorize @question

    redirect_to questions_path
  end

  def update
    @question.update(question_params)
    redirect_to(questions_path)

    authorize @question
  end

  def upvote
    @question = Question.find(params[:id])
    @question.upvote_by current_user
    redirect_to(questions_path)
    authorize @question
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_by current_user
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
