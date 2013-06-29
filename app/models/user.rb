class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :email
  validates_format_of :email, with: /\A.+@.+\..{2,4}\z/
  validates_uniqueness_of :email

  has_many :questions
  has_many :answers
end
