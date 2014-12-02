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

   describe "#sort_vimeo(vimeo_posts)" do
     it "sorts the vimeo feeds" do
       first = @all_vids.first
       expect(first.datetime).to eq "2014-04-12 12:22:48"
     end
   end

   describe "#get_vimeo_handle(url)" do
     it "grabs the vimeo_handle from the profile page url" do
        url= "https://vimeo.com/skwak"
        handle = url.scan(/\/\w+.$/).join("").delete("/")
        expect(handle).to eq "skwak"
      end
   end
end
