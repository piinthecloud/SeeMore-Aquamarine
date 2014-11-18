class Users < ActiveRecord::Base
  has_many :subscriptions
  has_many :feeds, through: :subscriptions
end
