Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]

  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]

  provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_SECRET"]

  provider :instagram, ENV["INSTAGRAM_CLIENT_ID"], ENV["INSTAGRAM_SECRET"]

end

Beemo.configuration[:access_token] = ENV["VIMEO_ACCESS_TOKEN"]
