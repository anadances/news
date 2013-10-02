class MovePostIdToNewColumn < ActiveRecord::Migration
  def change
    Comment.all.each do |comment|
      comment.update(:commentable_id => comment.post_id, commentable_type: "post")
    end  
    remove_column :comments, :post_id
  end
end
