require 'spec_helper'

describe Mention do
  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to belong_to(:mentioned) }
  it { is_expected.to belong_to(:mentioner) }
end
