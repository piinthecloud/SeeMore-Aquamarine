class HomeController < ApplicationController
  def index
    @feeds = Feed.where(social_media: "Vimeo")
  end
end
