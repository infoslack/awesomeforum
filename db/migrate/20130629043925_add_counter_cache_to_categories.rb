class AddCounterCacheToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :questions_count, :integer, null: false, default: 0
  end
end
