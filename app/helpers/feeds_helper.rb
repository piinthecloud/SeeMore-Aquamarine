module FeedsHelper


  def get_vimeo_handle(url)
    new_url = url.scan(/\/\w+.$/).join("").delete("/")
  end

  def parse_vimeo
    @feeds.each do |feed|
      user_videos = Vimeo::Simple::User.all_videos(feed.handle)
      @user_videos_by_date = user_videos.map { |video| video["upload_date"] }.flatten
    end
  end
end
