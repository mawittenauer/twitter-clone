require 'spec_helper'

describe User do
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to validate_uniqueness_of(:email) }
  
  describe "#user_feed" do
    let(:follower) { Fabricate(:user) }
    let(:leader) { Fabricate(:user) }
    let(:leader2) { Fabricate(:user) }
    let(:leader_tweet) { Fabricate(:tweet, user_id: leader.id) }
    let(:follower_tweet) { Fabricate(:tweet, user_id: follower.id) }
    let(:leader_tweet_2) { Fabricate(:tweet, user_id: leader.id, created_at: 1.day.ago) }
    let(:leader2_tweet) { Fabricate(:tweet, user_id: leader2.id) }
    before do
      Relationship.create(leader_id: leader.id, follower_id: follower.id)
    end
    it "contains tweets from active relationships" do
      expect(follower.user_feed).to include(leader_tweet)
    end
    it "does not contain tweets for non active relationships" do
      expect(follower.user_feed).to_not include(leader2_tweet)
    end
    it "shows users own tweets" do
      expect(follower.user_feed).to include(follower_tweet)
    end
  end
end
