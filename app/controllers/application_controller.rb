class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def all_git_feeds
    @all_git_feeds = User.find(session[:user_id]).feeds.where(social_media: "github")

  end

  helper_method :all_git_feeds

end
