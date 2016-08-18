require 'spec_helper'

describe PagesController do
  describe "GET home" do
    it "redirects to log in page for unautherized users" do
      get :home
      expect(response).to redirect_to sign_in_path
    end
    
    it "sets unseen_mentions to 0 when mention tab is selected" do
      user = Fabricate(:user, unseen_mentions: 1)
      session[:user_id] = user.id
      get :home, tab: "mentions"
      expect(user.reload.unseen_mentions).to eq(0)
    end
  end
end
