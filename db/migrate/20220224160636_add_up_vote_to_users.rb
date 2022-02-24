class AddUpVoteToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :upvote, :integer, default: 0
  end
end
