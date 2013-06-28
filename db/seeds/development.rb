require "./spec/support/factories"
include FactoryGirl::Syntax::Methods

# clean db
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# create root user
users = []

users << create(:user,
  name: "Daniel Romero",
  email: "infoslack@gmail.com",
  password: "test"
)

# create more users
35.times do
  name = Faker::Name.name

  users << create(:user,
    name: name,
    email: Faker::Internet.email(name),
    password: "test"
  )
end

# create categories
categories = []

%w[Ruby JavaScript Shell Java Python].each do |name|
  categories << create(:category, name: name)
end

# create questions
questions = []

100.times do
  questions << create(:question,
    user: users.sample,
    category: categories.sample,
    title: Faker::Lorem.words([*7..15].sample).join("  ").capitalize << "?",
    content: Faker::Lorem.paragraphs([*1..6].sample).join("\n\n")
  )
end
