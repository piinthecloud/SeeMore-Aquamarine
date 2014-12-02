class SubscriptionsController < ApplicationController

  def subscribe
    @user = User.find(session[:user_id])
      if Feed.find_by(uid: params[:id])
        @user.feeds << Feed.find_by(uid: params[:id])
      else
        @feed = Feed.create(uid: params[:id], handle: params[:screen_name], social_media: "twitter")
        @user.feeds << Feed.find_by(uid: params[:id])
      end

      redirect_to "/"

  end

end
