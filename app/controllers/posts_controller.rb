class PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.sort_by_votes
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post saved"
    end  
    redirect_to root_path
  end  

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new(:user_id => current_user.id) if current_user
  end

private
  def post_params
    params.require(:post).permit(:title, :url)
  end  

end
