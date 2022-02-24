class AddCurrencyToPrice < ActiveRecord::Migration[6.1]
  def change
    add_monetize :furnitures, :price, currency: { present: false }
  end
end
