class Feed < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :posts

end
