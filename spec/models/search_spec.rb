require 'spec_helper'

describe Search do
  describe "#user_search" do
    let(:user_1) { Fabricate(:user, tag: "mike") }
    let(:user_2) { Fabricate(:user, tag: "mikew") }
    let(:user_3) { Fabricate(:user, tag: "jmikew") }
    let(:user_4) { Fabricate(:user, tag: "ryanw") }
    it "returns one user for an exact match" do
      expect(Search.user_search("mike")).to include(user_1)
    end
    it "returns multiple users for a partial match" do
      expect(Search.user_search("mike")).to match_array([user_1, user_2, user_3])
    end
    it "returns an empty array for no match" do
      expect(Search.user_search("jessica")).to eq([])
    end
    it "returns an empty array for an empty string search term" do
      expect(Search.user_search("")).to eq([])
    end
    it "returns an empty array for an string of spaces search term" do
      expect(Search.user_search(" ")).to eq([])
    end
  end
end
