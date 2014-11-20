class FeedsController < ApplicationController

  def search_vimeo
    @feed = Feed.new
    @search = params[:search]
    @vimeo_feeds = Vimeo::Simple::User.info(@search)
    # if @vimeo_results.count > 0
    #   @vimeo_results = @vimeo_feeds.parsed_response
    # else
    #   redirect_to root_path, :notice => "No results. Sorry :-("
    # end
  end

  def create_vimeo_feed
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to root_path
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:handle, :social_media)
  end
end
