class AddUserhistoryToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_history, :text, array: true, default: []
  end
end
