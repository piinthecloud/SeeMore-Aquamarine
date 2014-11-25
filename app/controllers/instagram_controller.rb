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


end
