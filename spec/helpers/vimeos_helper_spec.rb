require 'rails_helper'

describe VimeosHelper do

  before do
    @current_user = User.create(id: 1)
    Feed.create(id: 1, social_media: "Vimeo", handle: "ericwareheim")
    Feed.create(id: 2, social_media: "Vimeo", handle: "user3644277")
    Subscription.create(user_id: 1, feed_id: 1)
    Subscription.create(user_id:1, feed_id: 2)
    Post.create(content: "https://vimeo.com/91796825", feed_id: 1, datetime: "2014-04-12 12:22:48")
    Post.create(content: "https://vimeo.com/11122534", feed_id: 2, datetime: "2010-04-21 19:25:59")
    @feeds = @current_user.feeds.where(social_media: "Vimeo")
    @all_vids = []
    @feeds.each do |account|
      @all_vids << account.posts
   end
   @all_vids.flatten!
   @all_vids = @all_vids.sort_by { |vid| vid.datetime }.reverse
  end

   describe "#all_vimeos" do
     it "gets all the vimeo feeds" do
       expect(@feeds.count).to eq 2
     end
   end

   describe "#get_videos_all_together(all_vimeo_accounts)" do
     it "sorts the vimeo feeds" do
       first = @all_vids.first
       expect(first.datetime).to eq "2014-04-12 12:22:48"
     end
   end
end
# module VimeosHelper
#
#   def all_vimeos
#     @all_vimeos = @current_user.feeds.where(social_media: "Vimeo")
#   end
#
#   def sort_vimeo(vimeo_posts)
#     vimeo_posts.sort_by { |post| post.datetime }.reverse
#   end
#
#   def get_videos_all_together(all_vimeo_accounts)
#     @all_vids = []
#     all_vimeo_accounts.each do |account|
#       @all_vids << account.posts
#     end
#     @all_vids.flatten!
#     @all_vids = @all_vids.sort_by { |vid| vid.datetime }.reverse
#   end
#
#  # don't need this anymore
#   # def parse_vimeo
#   #   @get_vimeo = @all_vimeos.collect { |feed| Vimeo::Simple::User.all_videos(feed.handle).parsed_response }
#   #   @get_vimeo.flatten!
#   #   @vimeos = @get_vimeo.sort_by { |video| video["upload_date"] }.reverse
#   # end
#
#   def get_profile_picture(obj)
#     @med_portrait = obj["sizes"][2]["link"]
#   end
#
#   def get_vimeo_handle(url)
#     url.scan(/\/\w+.$/).join("").delete("/")
#   end
#
#   def get_vimeo_feed(handle)
#     Vimeo::Simple::User.info(handle)
#   end
#
#   def get_id_number(url)
#     url.scan(/\d+$/).join("")
#   end
#
# end
