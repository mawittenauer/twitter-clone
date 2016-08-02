class RelationshipsController < ApplicationController
  before_action :require_user
  
  def create
    leader = User.find(params[:user_id])
    Relationship.create(follower: current_user, leader: leader) if current_user.can_follow?(leader)
    redirect_to leader
  end
  
  def destroy
    leader = User.find(params[:id])
    relationship = Relationship.find_by(leader: leader, follower: current_user)
    relationship.destroy if relationship
    redirect_to leader
  end
end
