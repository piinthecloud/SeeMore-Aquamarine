class FeedsController < ApplicationController



  def search_vimeo
    @search = params[:search]
    @vimeo_feeds = Vimeo::Simple::User.info(@search)
    @vimeo_results = @vimeo_feeds.parsed_response
  end

  private


end
