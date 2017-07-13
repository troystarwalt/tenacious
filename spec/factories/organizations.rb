FactoryGirl.define do
  factory :organization do
    name { Faker::Name.unique.first_name }
    association :owner, factory: :user
  end
end
