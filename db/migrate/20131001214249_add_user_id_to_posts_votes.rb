class AddUserIdToPostsVotes < ActiveRecord::Migration
  def change
    add_column :votes, :user_id, :integer
    add_column :posts, :user_id, :integer
  end
end
