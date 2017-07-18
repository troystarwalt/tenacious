class InventoryUser < ApplicationRecord
  belongs_to :user
  belongs_to :inventory

  enum user_role: {
    'Read' => 0,
    'Write' => 1,
    'Admin' => 2
  }

  validates :user_role, inclusion: user_roles.keys
end
