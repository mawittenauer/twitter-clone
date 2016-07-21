class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password validation: false
  validates_presence_of :email, :tag, :password
  validates_uniqueness_of :email, :tag
end
