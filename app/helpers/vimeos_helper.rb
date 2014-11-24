module VimeosHelper

  def all_vimeos
    @all_vimeos = @current_user.feeds.where(social_media: "Vimeo")
  end

  def parse_vimeo
    @get_vimeo = @all_vimeos.collect { |feed| Vimeo::Simple::User.all_videos(feed.handle).parsed_response }
    @get_vimeo.flatten!
    @vimeos = @get_vimeo.sort_by { |video| video["upload_date"] }.reverse
  end

  def get_profile_picture(obj)
    @med_portrait = obj["sizes"][2]["link"]
  end

  def get_vimeo_handle(url)
    new_url = url.scan(/\/\w+.$/).join("").delete("/")
  end


end
