class AddRentedToFurnitures < ActiveRecord::Migration[6.1]
  def change
    add_column :furnitures, :rented, :boolean, default: false
  end
end
