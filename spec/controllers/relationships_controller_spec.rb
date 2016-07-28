require 'spec_helper'

describe RelationshipsController do
  describe "POST create" do
    it "redirects to the sign in page for unauthenticated users" do
      post :create, user_id: 1
      expect(response).to redirect_to sign_in_path
    end
    
    context "with authenticated user" do
      let(:leader) { Fabricate(:user) }
      let(:follower) { Fabricate(:user) }
      before do
        session[:user_id] = follower.id
        post :create, user_id: leader.id
      end
      it "redirects to the user show page" do
        expect(response).to redirect_to leader
      end
      it "creates a new relationship" do
        expect(Relationship.count).to eq(1)
      end
      it "creates a new relationship with the follower as the signed in user" do
        expect(Relationship.first.follower).to eq(follower)
      end
      it "creates a new relationship with the leader as the user id" do
        expect(Relationship.first.leader).to eq(leader)
      end
      it "doesn't create the same relationship twice" do
        post :create, user_id: leader.id
        expect(Relationship.count).to eq(1)
      end
      it "doesn't allow the signed in user to follow itself" do
        post :create, user_id: follower.id
        expect(Relationship.count).to eq(1)
      end
    end
  end
end
