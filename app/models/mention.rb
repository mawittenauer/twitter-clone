class Mention < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :mentioned, class_name: 'User'
  belongs_to :mentioner, class_name: 'User'
end
