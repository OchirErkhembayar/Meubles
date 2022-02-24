class Order < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
  monetize :amount_cents
end
