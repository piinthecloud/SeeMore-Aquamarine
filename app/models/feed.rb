class Feed < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :posts

  def self.feed_and_posts(params)
    feed = Feed.new(params)
    if !Post.all.find_by(feed_id: params[:id]).exists?
      @all_posts = Vimeo::Simple::User.all_videos("skwak").parsed_response
      @posts = @all_posts.collect { |post| Post.create(feed_id: params[:id], content: post["url"], date: post["upload_date"]) }
    end
  end

# from vimeos helper
# def all_vimeos
#   @all_vimeos = @current_user.feeds.where(social_media: "Vimeo")
# end
#
# def parse_vimeo
#   @get_vimeo = @all_vimeos.collect { |feed| Vimeo::Simple::User.all_videos(feed.handle).parsed_response }
#   @get_vimeo.flatten!
#   @vimeos = @get_vimeo.sort_by { |video| video["upload_date"] }.reverse
# end
#
# def get_profile_picture(obj)
#   @med_portrait = obj["sizes"][2]["link"]
# end
#
# def get_vimeo_handle(url)
#   new_url = url.scan(/\/\w+.$/).join("").delete("/")
# end
#
# def get_vimeo_feed(handle)
#   Vimeo::Simple::User.info(handle)
# end



end
