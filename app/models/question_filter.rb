class QuestionFilter
  def self.filter(options)
    scope = Question
      .paginate(options[:p])
      .order_by_answer_date
      .includes(:user, :category)

    scope = scope.unanswered if options[:filter] == "unanswered"
    scope
  end
end
