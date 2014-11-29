class GithubController < ApplicationController

  # def initialize
  #   @client = Octokit::Client.new(:access_token => auth_hash["credentials"]["token"])
  #
  # end

  def search_github
    @feed = Feed.new
    @search_text = params[:search]
    @git_results = Octokit.search_users("#{@search_text} in:login").to_hash[:items]

  end



  def create_github_feed
    @feed = Feed.new(feed_params)
    if @feed.save
      @subscription ? @subscription : @subscription = Subscription.create(:user_id => session[:user_id], :feed_id => @feed.id)
      redirect_to root_path
    end
  end

  def delete_github_feed
    @feed = Feed.find(params[:id])
    if @feed.destroy
      redirect_to root_path, :notice => "Subscription deleted!"
    else
      redirect_to root_path, :notice => "Something went wrong"
    end
  end


private
  def feed_params
    params.require(:feed).permit(:handle, :social_media)
  end


end
