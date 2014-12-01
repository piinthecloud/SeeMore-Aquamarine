module VimeosHelper

  def all_vimeos
    @all_vimeos = @current_user.feeds.where(social_media: "Vimeo")
  end

  def sort_vimeo(vimeo_posts)
    vimeo_posts.sort_by { |post| post.datetime }.reverse
  end

  def get_videos_all_together(all_vimeo_accounts)
    @all_vids = []
    all_vimeo_accounts.each do |account|
      @all_vids << account.posts
    end
    @all_vids.flatten!
    @all_vids = @all_vids.sort_by { |vid| vid.datetime }.reverse
  end
  
 # don't need this anymore
  # def parse_vimeo
  #   @get_vimeo = @all_vimeos.collect { |feed| Vimeo::Simple::User.all_videos(feed.handle).parsed_response }
  #   @get_vimeo.flatten!
  #   @vimeos = @get_vimeo.sort_by { |video| video["upload_date"] }.reverse
  # end

  def get_profile_picture(obj)
    @med_portrait = obj["sizes"][2]["link"]
  end

  def get_vimeo_handle(url)
    new_url = url.scan(/\/\w+.$/).join("").delete("/")
  end

  def get_vimeo_feed(handle)
    Vimeo::Simple::User.info(handle)
  end

  def get_id_number(url)
    url.scan(/\d+$/).join("")
  end

end
