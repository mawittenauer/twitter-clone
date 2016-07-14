require 'spec_helper'

describe Tweet do
  it { is_expected.to validate_presence_of(:body) }
  
  it "validates length maximum 140" do
    tweet = Tweet.new(body: "i" * 141)
    tweet.save
    expect(Tweet.count).to eq(0)
  end
end
