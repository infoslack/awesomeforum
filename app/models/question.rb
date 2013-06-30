class Question < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :category, counter_cache: true
  has_many :answers

  validates_presence_of :title, :content, :user, :category

  scope :order_by_answer_date, -> {
    select("questions.*, COALESCE(answered_at, created_at) as sorting_field")
    .order("sorting_field desc")
  }

  scope :unanswered, -> { where(answered_at: nil) }

  def hit!
    increment! :hits
  end
end
