class InventoryUser < ApplicationRecord
  belongs_to :user
  belongs_to :inventory

  validates :user_role, presence: true

  enum user_role: [:read, :write, :admin]
end
