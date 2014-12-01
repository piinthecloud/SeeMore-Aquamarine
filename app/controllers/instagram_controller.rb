class InstagramController < ApplicationController

  def search
    # send a get request to instagram to get the json obj
    # https://api.instagram.com/v1/users/search?q=params[:username]
    # requires the access token that has been put into .env
    #ENV[INSTAGRAM_ACCESS_TOKEN]
    api = HTTParty.get("https://api.instagram.com/v1/users/search?access_token=#{ENV["INSTAGRAM_ACCESS_TOKEN"]}&q=#{params[:username]}")
    @api = api.parsed_response["data"]

     #raise api.inspect

  end

  def create
  # create a new feed
  feed = HTTParty.get("https://api.instagram.com/v1/users/#{params[:id]}/media/recent?access_token=#{ENV["INSTAGRAM_ACCESS_TOKEN"]}")
  create_instagram_feed_and_subscription
  #raise feed.inspect
  redirect_to root_path
  end

  def create_instagram_feed_and_subscription
    if @feed = Feed.create(params.require(:feed).permit(:handle, :social_media, :uid))
      Subscription.create(:user_id => session[:user_id] , :feed_id => @feed.id)
    end

    # if this feed saves also create a subscription this the feed Subscription.create()

  end

end


#https://api.instagram.com/v1/users/708052543/media/recent
