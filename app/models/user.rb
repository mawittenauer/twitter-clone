class User < ActiveRecord::Base
  before_validation { downcase_email }
  
  has_many :tweets
  has_secure_password validation: false
  validates_presence_of :email, :tag, :password
  validates_uniqueness_of :email, :tag
  
  def downcase_email
    self.email.downcase!
  end
end
