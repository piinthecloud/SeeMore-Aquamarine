class InstagramController < ApplicationController

  def search
    # send a get request to instagram to get the json obj
    # https://api.instagram.com/v1/users/search?q=params[:username]
    # requires the access token that has been put into .env
    #ENV[INSTAGRAM_ACCESS_TOKEN]
    api_user = HTTParty.get("https://api.instagram.com/v1/users/search?access_token=#{ENV["INSTAGRAM_ACCESS_TOKEN"]}&q=#{params[:username]}")
    
    render :results
    raise api.inspect

  end
end
