class SubscriptionsController < ApplicationController

  def subscribe
    @user = User.find(session[:user_id])
      if Feed.find_by(handle: params[:screen_name])
        @user.feeds << Feed.find_by(handle: params[:screen_name])
      else
        @feed = Feed.create(handle: params[:screen_name])
        @user.feeds << Feed.find_by(handle: params[:screen_name])
      end

      redirect_to result

  end

end
