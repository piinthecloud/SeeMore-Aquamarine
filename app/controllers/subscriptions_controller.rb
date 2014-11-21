class SubscriptionsController < ApplicationController

  def subscribe
    if Feed.find_by(:screen_name)
      user.feeds << Feed.find_by(handle: params[:screen_name])
    else
      @feed = Feed.create(handle: params[:screen_name])
      user.feeds << Feed.find_by(handle: params[:screen_name])
    end
  end

end
