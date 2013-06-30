desc "Update Question#unanswered_at"
task :update_answered_at => :environment do
  Question.where.not(answers_count: 0).find_each do |question|
    answered_at = question.answers.order("created_at desc").first.created_at
    question.update_columns answered_at: answered_at
  end
end
