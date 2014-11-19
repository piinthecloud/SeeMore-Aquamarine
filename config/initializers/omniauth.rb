Rails.application.config.middleware.use OmniAuth::Builder do

  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]

  # provider :developer unless Rails.new
  # provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]

  # provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_SECRET"]

  # provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]

end
