class AddDescriptionToFurnitures < ActiveRecord::Migration[6.1]
  def change
    add_column :furnitures, :description, :text
  end
end
