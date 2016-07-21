class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to sign_in_path
    else
      flash.now[:danger] = "There were the following errors with your submission"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:tag, :email, :password)
  end
end
