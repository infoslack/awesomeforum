class Question < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :category, counter_cache: true
  has_many :answers

  validates_presence_of :title, :content, :user, :category

  def hit!
    increment! :hits
  end
end
