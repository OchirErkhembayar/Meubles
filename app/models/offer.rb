class Offer < ApplicationRecord
  belongs_to :furniture
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
end
