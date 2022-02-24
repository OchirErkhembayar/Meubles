class Furniture < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :category
  has_many :offers, dependent: :destroy
  has_many :users, through: :offers
  has_one_attached :photo
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: { minimum: 3 }
end
