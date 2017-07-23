FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(14, 128) }

    trait :confirmed do
      confirmed_at Time.now
    end
  end
end
