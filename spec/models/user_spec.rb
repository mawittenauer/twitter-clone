require 'spec_helper'

describe User do
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to validate_uniqueness_of(:email) }
end
