FactoryGirl.define do
  factory :inventory_user do
    association :user, factory: :user
    association :inventory, factory: :inventory

    trait :read do
      user_role 0
    end

    trait :write do
      user_role 1
    end

    trait :admin do
      user_role 2
    end
  end
end
