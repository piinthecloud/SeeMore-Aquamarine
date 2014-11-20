module FeedsHelper


  def get_vimeo_handle(url)
    new_url = url.scan(/\/\w+.$/).join("").delete("/")
  end

  def parse_vimeo
    @get_vimeo = @feeds.collect { |feed| Vimeo::Simple::User.all_videos(feed.handle).parsed_response }
    @get_vimeo.flatten!
    @vimeos = @get_vimeo.sort_by { |video| video["upload_date"] }.reverse
  end

end
