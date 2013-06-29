class AnswersController < ApplicationController
  before_action :require_logged_user

  def create
    question = Question.find(params[:question_id])
    answer = current_user.answers.new(
      answer_params.merge(question: question)
    )

    if answer.save
      options = { notice: t("flash.answers.create.notice") }
    else
      options = {
        alert: answer.errors.full_messages.to_sentence.capitalize
      }
    end

    redirect_to question_path(question), options
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
