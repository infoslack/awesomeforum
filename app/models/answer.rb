class Answer < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  belongs_to :question, counter_cache: true, touch: :answered_at

  validates_presence_of :content, :user, :question
  validates_length_of :content, minimum: 15
end
