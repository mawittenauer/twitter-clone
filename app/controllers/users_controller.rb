class UsersController < ApplicationController
  before_action :require_user, only: [:index]
  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)
  end
  
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
  end
  
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
    params.require(:user).permit(:tag, :email, :password, :avatar)
  end
end
