class PagesController < ApplicationController
  before_action :require_user, only: [:home]
  
  def home
    @tweet = Tweet.new
    @tweets = current_user.user_feed
    @mentions = current_user.mentions.includes(:tweet).order("created_at DESC")
  end
  
  def front
    redirect_to home_path if logged_in?
  end
end
