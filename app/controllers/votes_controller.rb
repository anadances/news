class VotesController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @post.votes.create(:user_id => current_user.id)
    flash[:notice] = "Vote casted"
    redirect_to root_path
  end
end    