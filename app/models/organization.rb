class Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
    has_many :inventories
    has_and_belongs_to_many :users
end
