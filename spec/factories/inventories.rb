FactoryGirl.define do
  factory :inventory do
    name { Faker::Name.unique.first_name }
    description { Faker::Lorem.sentence }
  end
end
