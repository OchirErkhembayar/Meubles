class Review < ApplicationRecord
  belongs_to :user

  validates :rating, presence: true, inclusion: (0..5)
  validates :content, presence: true, length: { minimum: 5 }
end
