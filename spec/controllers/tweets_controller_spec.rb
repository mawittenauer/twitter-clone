require 'spec_helper'

describe TweetsController do
  describe "POST create" do
    context "with valid input" do
      before { post :create, tweet: { body: "My first tweet :)" } }
      it "creates a new tweet" do
        expect(Tweet.count).to eq(1)
      end
      it "redirects the home page" do
        expect(response).to redirect_to home_path
      end
    end
    context "with invalid input" do
      before { post :create, tweet: { body: "" } }
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
