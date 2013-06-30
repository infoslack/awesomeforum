class QuestionsController < ApplicationController
  before_action :require_logged_user, only: %w[ new create ]
  before_action :find_categories, only: %w[ new create ]
  layout :set_layout_file

  def index
    @questions = QuestionFilter.filter(params)
  end

  def feed
    @question = Question.find(params[:id])
    @answers = @question.answers
      .order("created_at desc")
      .limit(10)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to question_path(@question),
        notice: t("flash.questions.create.notice")
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.includes(:user)
    @question.hit!
  end

  private
  def question_params
    params
      .require(:question)
      .permit(:title, :content, :category_id)
  end

  def find_categories
    @categories = Category.all
  end

  def set_layout_file
    "window" if %w[create new].include?(action_name)
  end
end
