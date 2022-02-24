class AddPaidToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :paid, :boolean, default: false
  end
end
