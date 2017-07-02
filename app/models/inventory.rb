class Inventory < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 255 }
end
