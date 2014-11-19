class TwitterController < ApplicationController

  def search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CLIENT_ID"]
      config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end

    @twusers = client.user_search(params["username"])

    render :result

  end

  def twimeline
    @twimeline =  client.home_timeline(params["id"])
  end

end
