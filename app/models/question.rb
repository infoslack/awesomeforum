class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :answers

  validates_presence_of :title, :content, :user, :category
end
