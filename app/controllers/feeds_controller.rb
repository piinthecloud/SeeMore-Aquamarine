class FeedsController < ApplicationController

  def search_vimeo
    @feed = Feed.new
    @search = params[:search]
    if @search.empty?
      redirect_to root_path, :notice => "You didn't search for anything. Try again."
    elsif URI::InvalidURIError
      redirect_to root_path, :notice => "No results. Try again."
    else
      @vimeo_results = Beemo::User.search(@search)
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
