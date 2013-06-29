class AddCounterCacheToUsers < ActiveRecord::Migration
  def change
    add_column :users, :questions_count, :integer, null: false, default: 0
    add_column :users, :answers_count, :integer, null: false, default: 0
  end
end
