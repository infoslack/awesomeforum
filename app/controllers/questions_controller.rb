class QuestionsController < ApplicationController
  before_action :require_logged_user, only: %w[ new create ]
  before_action :find_categories, only: %w[ new create ]

  def index
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
end
