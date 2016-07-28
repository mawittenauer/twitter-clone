require 'spec_helper'

describe Relationship do
  it { is_expected.to belong_to(:follower) }
  it { is_expected.to belong_to(:leader) }
end
