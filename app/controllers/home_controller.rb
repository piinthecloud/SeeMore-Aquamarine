class HomeController < ApplicationController
  def index
    @all_vimeos = Feed.all.where(social_media: "Vimeo")
    # @user ? User.find(params[:id]) : nil
    # if @user
    #   @all_vimeos = @user.feeds.where(social_media: "Vimeo")
    # end
  end
end
