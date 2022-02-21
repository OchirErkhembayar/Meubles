class Offer < ApplicationRecord
  belongs_to :furniture
  belongs_to :user
  validates :start_date, presence: true, in_future: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
end
