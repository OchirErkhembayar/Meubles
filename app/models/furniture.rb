class Furniture < ApplicationRecord
  has_many :categories
  has_many :offers, dependent: :destroy
  has_many :users, through: :offers
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true
  validates :location, presence: true
end
