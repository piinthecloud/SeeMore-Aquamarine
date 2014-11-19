class FeedsController < ApplicationController

  # def create
  #   Feed.new(feed_params)
  #   Feed.save(handle: @vimeo_results["display_name"], social_media: "Vimeo")
  # end

  def search_vimeo
    @search = params[:search]
    @vimeo_feeds = Vimeo::Simple::User.info(@search)
    @vimeo_results = @vimeo_feeds.parsed_response
  end

  private

  def feed_params
    params.require(:feed).permit(:handle, :social_media)
  end

end
