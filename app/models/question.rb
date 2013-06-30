class Question < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  tire.mapping do
    indexes :title,     analyzer: "snowball", boost: 100
    indexes :content,   analyzer: "snowball"
    indexes :sorting_date,  type: "date", include_in_all: true
  end

  belongs_to :user, counter_cache: true
  belongs_to :category, counter_cache: true
  has_many :answers

  validates_presence_of :title, :content, :user, :category

  scope :order_by_answer_date, -> {
    select("questions.*, COALESCE(answered_at, created_at) as sorting_field")
    .order("sorting_field desc")
  }

  scope :unanswered, -> { where(answered_at: nil) }

  def sorting_date
    answered_at || created_at
  end

  def hit!
    increment! :hits
  end
end
