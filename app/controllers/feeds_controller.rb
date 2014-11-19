class FeedsController < ApplicationController

  def search_vimeo
    @search = params[:search]
    @vimeo_feeds = Vimeo::Simple::User.info(@search)
    @vimeo_results = @vimeo_feeds.parsed_response
  end


  def create_vimeo_feed
    search_vimeo
    @handle = @vimeo_results["id"].to_s
    if Feed.create(handle: @handle, social_media: "Vimeo")
      redirect_to root_path
    end
  end

end
