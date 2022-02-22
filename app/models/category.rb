class Category < ApplicationRecord
  belongs_to :furniture
  validates :name, presence: true, length: { minimum: 3 }
end
