class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :feeds, through: :subscriptions
  has_many :oauths
end
