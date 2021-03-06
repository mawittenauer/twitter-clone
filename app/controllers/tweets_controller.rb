class TweetsController < ApplicationController
  before_action :require_user
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    @tweets = current_user.user_feed
    @mentions = current_user.mentions.includes(:tweet).order("created_at DESC")
    
    if @tweet.save
      handle_mentions(@tweet, current_user)
      redirect_to home_path
    else
      render 'pages/home'
    end
  end
  
  def reply
    @tweets = current_user.user_feed
    @mentions = current_user.mentions.includes(:tweet).order("created_at DESC")
    @user = User.find(params[:id])
    @tweet = Tweet.new(body: "@#{@user.tag}")
    render 'pages/home'
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
  
  def handle_mentions(tweet, mentioner)
    tweet.body.split(' ').each do |word|
      if word.start_with?('@')
        tag = word[1, word.length]
        user = User.find_by(tag: tag)
        Mention.create(mentioner: mentioner, mentioned: user, tweet: tweet) if user
        user.update_attribute("unseen_mentions", user.unseen_mentions + 1) if user
      end
    end
  end
end
