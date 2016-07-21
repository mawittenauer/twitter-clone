class TweetsController < ApplicationController
  before_action :require_user
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    
    if @tweet.save
      redirect_to home_path
    else
      render 'pages/home'
    end
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
