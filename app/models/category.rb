class Category < ApplicationRecord
  has_many :furnitures
  validates :name, presence: true, length: { minimum: 3 }
end
