class CommentsController < ApplicationController
  def new
    @comment = current_user.comments.new
  end

  def create
   @comment = current_user.comments.new(comment_params)

    if @comment.save
     flash[:notice] = "Comment saved"
     redirect_to @comment.post
    else 
     flash[:alert] = "Invalid input"
     redirect_to @comment.post
    end  
  end

  def show
   redirect_to @comment.post
  end


private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end   