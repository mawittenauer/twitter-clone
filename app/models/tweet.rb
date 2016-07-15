class Tweet < ActiveRecord::Base
  validates :body, presence: true,
                   length: { maximum: 140 }
end
