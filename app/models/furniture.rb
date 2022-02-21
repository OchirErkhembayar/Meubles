class Furniture < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true
  validates :location, presence: true, inclusion: {
    in: ["London", "Edinburgh", "Cambridge", "Glasgow", "Liverpool", "Birmingham", "Manchester"]
  }
end
