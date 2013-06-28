FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) {|n| "john#{n}@example.org"}
    password "test"
    password_confirmation "test"
  end

  factory :category do
    name "Some category"
  end

  factory :question do
    title "Some title"
    content "Some content"

    association :user
    association :category
  end

  preload do
    factory(:john) { create(:user) }
    factory(:ruby) { create(:category) }
  end
end
