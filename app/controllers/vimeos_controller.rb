class VimeosController < ApplicationController

  def search_vimeo
    @feed = Feed.new
    @search = params[:search]
    if @search.empty?
      redirect_to root_path, :notice => "You didn't search for anything. Try again."
    elsif @search.include?(" ")
      @vimeo_results = Beemo::User.search(@search.gsub(" ", "%20"))
      redirect_to root_path, :notice => "No results. Try again." if @vimeo_results.empty?
    else
      @vimeo_results = Beemo::User.search(@search)
      redirect_to root_path, :notice => "No results. Try again." if @vimeo_results.empty?
    end
  end

  def create_vimeo_feed
    @feed = Feed.new(feed_params)
    if @feed.save
      @all_posts = Vimeo::Simple::User.all_videos(@feed.handle).parsed_response
      @posts = @all_posts.collect { |post| Post.create(feed_id: @feed.id, content: post["url"], datetime: DateTime.parse(post["upload_date"])) }
      @subscription ? @subscription : @subscription = Subscription.create(:user_id => session[:user_id], :feed_id => @feed.id)
      redirect_to root_path
    end
  end

  def delete_vimeo_feed
    @subscription = Subscription.find_by(feed_id: params[:id], user_id: session[:user_id])
    if @subscription.destroy
      redirect_to root_path, :notice => "Subscription deleted."
    else
      redirect_to root_path, :notice => "Something went wrong."
    end
    # @feed = Feed.find(params[:id])
    # if @feed.destroy
    #   redirect_to root_path, :notice => "Subscription deleted."
    # else
    #   redirect_to root_path, :notice => "Something went wrong."
    # end
  end

  private

  def feed_params
    params.require(:feed).permit(:handle, :social_media)
  end
end
