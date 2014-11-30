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
  feed = HTTParty.get("https://api.instagram.com/v1/users/self/feed?access_token=#{ENV["INSTAGRAM_ACCESS_TOKEN"]}")
@feed =  Feed.create( AW!E@ 1qWq  aZ˜ )

  raise feed.inspect
  end


end


#https://api.instagram.com/v1/users/708052543/media/recent
