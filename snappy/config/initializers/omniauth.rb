Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.new
  provider :developer
end
