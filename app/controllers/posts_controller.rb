class PostsController < ApplicationController
  def new
    @post = Post.new
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post saved"
    end  
    redirect_to post_path(@post)
  end  

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :url)
  end  

end
