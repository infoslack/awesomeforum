class AddAnsweredAtToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answered_at, :datetime
    add_index :questions, :answered_at
  end
end
