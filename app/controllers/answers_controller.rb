class AnswersController < ApplicationController
  before_action :require_logged_user

  def create
    question = Question.find(params[:question_id])
    answer = current_user.answers.new(
      answer_params.merge(question: question)
    )
    answer.save

    redirect_to question_path(question),
      notice: t("flash.answers.create.notice")
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
