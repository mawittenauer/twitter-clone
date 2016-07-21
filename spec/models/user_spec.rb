require 'spec_helper'

describe User do
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:tag) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_uniqueness_of(:tag) }
end
