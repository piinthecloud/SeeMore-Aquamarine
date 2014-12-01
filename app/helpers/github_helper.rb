module GithubHelper

  def all_git_feeds
    @all_git_feeds = User.find(session[:user_id]).feeds.where(social_media: "github")

  end



end
