class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name} has been saved"
      sign_in @user
      redirect_to root_path
    else
      flash[:notice] = "Please check entries"
      redirect_to 'users_path#new'
    end    
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end    

private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)  
  end
end    