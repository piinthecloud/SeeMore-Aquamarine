Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]
=======
  # provider :developer unless Rails.new
  # provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]

  # provider :vimeo, ENV["VIMEO_CLIENT_ID"], ENV["VIMEO_SECRET"]

  # provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
>>>>>>> 0f93680b9e6a11f37e716056264f93a00f110bb5
end
