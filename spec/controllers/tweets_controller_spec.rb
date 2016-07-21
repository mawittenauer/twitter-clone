require 'spec_helper'

describe TweetsController do
  describe "POST create" do
    it "redirects to the sign in page for unauthenticated users" do
      post :create, tweet: { body: "My first tweet :)" }
      expect(response).to redirect_to sign_in_path
    end
    
    context "with valid input" do
      let(:user) { Fabricate(:user) }
      before do 
        session[:user_id] = user.id
        post :create, tweet: { body: "My first tweet :)" }
      end
      it "creates a new tweet" do
        expect(Tweet.count).to eq(1)
      end
      it "redirects the home page" do
        expect(response).to redirect_to home_path
      end
      it "associates the tweet with the signed in user" do
        expect(user.tweets).to include(Tweet.first)
      end
    end
    context "with invalid input" do
      let(:user) { Fabricate(:user) }
      before do 
        session[:user_id] = user.id
        post :create, tweet: { body: "" }
      end
      it "doesn't create a new tweet" do
        expect(Tweet.count).to eq(0)
      end
      it "renders the home page" do
        expect(response).to render_template 'pages/home'
      end
      it "sets @tweet" do
        expect(assigns(:tweet)).to be_instance_of Tweet
      end
    end
  end
end
