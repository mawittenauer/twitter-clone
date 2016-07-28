class User < ActiveRecord::Base
  before_validation { downcase_email }
  
  has_many :tweets
  has_secure_password validation: false
  validates_presence_of :email, :tag, :password
  validates_uniqueness_of :email, :tag
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :leaders, through: :following_relationships
  
  def downcase_email
    self.email.downcase!
  end
  
  def can_follow?(user)
    !leaders.include?(user) && user != self
  end
end
