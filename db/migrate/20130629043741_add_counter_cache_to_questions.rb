class AddCounterCacheToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answers_count, :integer, null: false, default: 0
  end
end
