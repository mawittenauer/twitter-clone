class SearchController < ApplicationController
  before_action :require_user
  
  def user_search
    @results = Search.user_search(params[:search_term])
  end
end
