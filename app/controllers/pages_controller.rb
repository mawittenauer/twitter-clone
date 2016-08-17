class PagesController < ApplicationController
  before_action :require_user, only: [:home]
  
  def home
    @tweet = Tweet.new
    @tweets = current_user.user_feed
    @mentions = current_user.mentions.includes(:tweet).order("created_at DESC")
    current_user.update_attribute("unseen_mentions", 0) if params[:tab] === "mentions"
  end
  
  def front
    redirect_to home_path if logged_in?
  end
end
