class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash.now[:danger] = "There was something wrong with your username/password"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to sign_in_path
  end
end
  