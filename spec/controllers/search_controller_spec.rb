require 'spec_helper'

describe SearchController do
  describe "GET user_search" do
    let(:user) { Fabricate(:user, tag: "mike") }
    it "redirects to the sign in page for unauthenticated users" do
      get :user_search, search_term: "mike"
      expect(response).to redirect_to sign_in_path
    end
    
    it "sets @results" do
      session[:user_id] = Fabricate(:user).id
      get :user_search, search_term: "mike"
      expect(assigns(:results)).to eq([user])
    end
  end
end
