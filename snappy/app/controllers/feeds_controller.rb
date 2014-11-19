class FeedsController < ApplicationController

  def search_vimeo
    @search = params[:search]
    @vimeo_feeds = Vimeo::Simple::User.info(@search)
    request.parsed_response
  end

end
