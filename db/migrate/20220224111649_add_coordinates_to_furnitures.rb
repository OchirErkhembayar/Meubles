class AddCoordinatesToFurnitures < ActiveRecord::Migration[6.1]
  def change
    add_column :furnitures, :latitude, :float
    add_column :furnitures, :longitude, :float
  end
end
