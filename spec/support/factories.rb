FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) {|n| "john#{n}@example.org"}
    password "test"
    password_confirmation "test"
  end

  preload do
    factory(:john) { create(:user) }
  end
end
