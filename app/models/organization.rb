class Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false}, length: { maximum: 255 }

  has_many :inventories
  has_and_belongs_to_many :users
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
end
