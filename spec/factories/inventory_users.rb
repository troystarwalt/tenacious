FactoryGirl.define do
  factory :inventory_user do
    association :user, factory: :user
    association :inventory, factory: :inventory
  end
end
