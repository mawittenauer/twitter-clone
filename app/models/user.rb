class User < ActiveRecord::Base
  before_validation { downcase_email }
  before_validation { remove_spaces_from_tag }
  
  has_many :tweets
  has_many :mentions, class_name: 'Mention', foreign_key: 'mentioned_id'
  has_secure_password validation: false
  validates_presence_of :email, :tag, :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, :tag
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :leaders, through: :following_relationships
  mount_uploader :avatar, AvatarUploader
  
  def downcase_email
    self.email.downcase!
  end
  
  def remove_spaces_from_tag
    self.tag.gsub!(/\s+/, "")
  end
  
  def can_follow?(user)
    !leaders.include?(user) && user != self
  end
  
  def can_unfollow?(user)
    leaders.include?(user) && user != self
  end
  
  def user_feed
    following_ids = "SELECT leader_id FROM relationships
                     WHERE  follower_id = :user_id"
    Tweet.where("user_id IN (#{following_ids})
OR user_id = :user_id", user_id: id).order("created_at DESC")
  end
end
