class PagesController < ApplicationController
  def home
    @tweet = Tweet.new
  end
end
