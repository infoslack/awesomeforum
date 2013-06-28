class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.belongs_to :user, index: true, null: false
      t.belongs_to :category, index: true, null: false

      t.timestamps
    end
  end
end
