class GithubController < ApplicationController

  # def initialize
  #   @client = Octokit::Client.new(:access_token => auth_hash["credentials"]["token"])
  #
  # end

  def search_github
    @search_text = params[:search]
    @results = Octokit.search_users("#{@search_text} in:login")

  end

  def results
    search_github
  end

end
