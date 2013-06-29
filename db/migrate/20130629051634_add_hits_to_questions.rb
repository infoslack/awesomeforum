class AddHitsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :hits, :integer, null: false, default: 0
  end
end
