class HomeController < ApplicationController
  def index
    @feeds = Feed.all
    @fake = Vimeo::Simple::User.videos("mix")
  end
end
