class HomeController < ApplicationController
  def index
    @all_vimeos = Feed.all.where(social_media: "Vimeo")
  end
end
