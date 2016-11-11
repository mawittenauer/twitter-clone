require 'spec_helper'

describe SearchController do
  describe "GET user_search" do
    it "redirects to the sign in page for unauthenticated users" do
      get :user_search, search_term: "mike"
      expect(response).to redirect_to sign_in_path
    end
  end
end
