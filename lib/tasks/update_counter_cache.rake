desc "Update counter cache from models"
task :update_counter_cache => :environment do
  updater = -> model, *counters {
    model.find_each do |record|
      model.reset_counters record.id, *counters
    end
  }

  updater.call User, :answers, :questions
  updater.call Category, :questions
  updater.call Question, :answers
end
