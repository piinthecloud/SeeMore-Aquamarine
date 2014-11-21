class FeedsController < ApplicationController

  def search_vimeo
    @feed = Feed.new
    @search = params[:search]
    if @search.include?(" ") || @search.empty?
      redirect_to root_path, :notice => "Couldn't find anything. Try again."
    else
      @vimeo_feeds = Vimeo::Simple::User.info(@search)
      @vimeo_results = @vimeo_feeds.parsed_response
    end
  end

  def create_vimeo_feed
    @feed = Feed.new(feed_params)
    if @feed.save
      @subscription ? @subscription : @subscription = Subscription.create(:user_id => session[:user_id], :feed_id => @feed.id)
      redirect_to root_path
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:handle, :social_media)
  end
end
