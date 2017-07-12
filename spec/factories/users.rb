FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :confirmed do
      confirmed_at Time.now
    end
  end
end
