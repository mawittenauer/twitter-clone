require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of User
    end
  end
  
  describe "POST create" do
    context "with valid input" do
      before { post :create, user: { email: "mike@me.com", password: "password", tag: "mike" } }
      it "redirects to the sign in page" do
        expect(response).to redirect_to sign_in_path
      end
      it "creates a new user" do
        expect(User.count).to eq(1)
      end
    end
    context "with invalid input" do
      before { post :create, user: { email: "", passowrd: "", tag: "" } }
      it "renders the new template" do
        expect(response).to render_template :new
      end
      it "doesn't create a new user" do
        expect(User.count).to eq(0)
      end
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of User
      end
      it "sets the flash danger message" do
        expect(flash[:danger]).to be_present
      end
    end
  end
end
