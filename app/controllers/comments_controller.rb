class CommentsController < ApplicationController
  def new
    @comment = current_user.comments.new
  end

  def create
   @comment = current_user.comments.new(comment_params)

    if @comment.save
     flash[:notice] = "Comment saved"
     redirect_to @comment.commentable
    else 
     flash[:alert] = "Invalid input"
     redirect_to @comment.commentable
    end  
  end

  def show
    @comment = Comment.find(params[:id])
    @newcomment = Comment.new(:commentable_id => @comment.id, :commentable_type => Comment)
  end


private
  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end
end   