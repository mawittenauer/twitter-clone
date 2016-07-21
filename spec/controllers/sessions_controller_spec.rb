require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    context "with valid input" do
      let(:user) { Fabricate(:user) }
      before do
        post :create, email: user.email, password: user.password
      end
      it "redirects to the home page" do
        expect(response).to redirect_to home_path
      end
      it "adds the user to the session" do
        expect(session[:user_id]).to eq(user.id)
      end
    end
    context "with invalid input" do
      before { post :create, email: "mike@me.com", password: "password" }
      it "renders the new template" do
        expect(response).to render_template :new
      end
      it "doesn't add a user to the session" do
        expect(session[:user_id]).to_not be_present
      end
      it "sets the flash danger message" do
        expect(flash[:danger]).to be_present
      end
    end
  end
  
  describe "GET destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end
    it "redirects to the sign in page" do
      expect(response).to redirect_to sign_in_path
    end
    it "removes the user from the session" do
      expect(session[:user_id]).to_not be_present
    end
    it "sets the flash success message" do
      expect(flash[:success]).to be_present
    end
  end
end
