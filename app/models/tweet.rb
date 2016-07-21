class Tweet < ActiveRecord::Base
  validates :body, presence: true,
                   length: { maximum: 140 }
  
  belongs_to :user
end
