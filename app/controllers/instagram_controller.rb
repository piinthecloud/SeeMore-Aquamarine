class InstagramController < ApplicationController

  def search
    # send a get request to instagram to get the json obj
    # https://api.instagram.com/v1/users/search?q=params[:username]
    # requires the access token that has been put into .env
    #ENV[INSTAGRAM_ACCESS_TOKEN]
    api = HTTParty.get("https://api.instagram.com/v1/users/search?access_token=#{ENV["INSTAGRAM_ACCESS_TOKEN"]}&q=#{params[:username]}")
    @api = api.parsed_response["data"]
  end

  def create
  # create a new feed
  create_instagram_feed_and_subscription


  redirect_to root_path
  end

  def create_instagram_feed_and_subscription
    # if this feed saves also create a subscription this the feed Subscription.create()
    if @feed = Feed.create(params.require(:feed).permit(:handle, :social_media, :uid))
      Subscription.create(:user_id => session[:user_id] , :feed_id => @feed.id)
    end
  end

  def index
    subscriptions = Subscription.where(user_id: session[:user_id])
    feed_uid = []
    subscriptions.each do |s|
      f = Feed.find(s.feed_id)
      feed_uid << f.uid
    end
    @feed = []
    feed_uid.each do |uid|
      a = HTTParty.get("https://api.instagram.com/v1/users/#{uid}/media/recent?access_token=#{ENV["INSTAGRAM_ACCESS_TOKEN"]}")
      #raise a.inspect
      @feed << a.parsed_response["data"]
    end
  end

end





# <!--  get request for /instagram-->
# <!--  based on current user find all their subscriptions-->
# <!--  x = Subscription.find_by(user_id: sessions[:user_id])-->
# <!--  find the feed id of each subscription-->
# <!--  y =Feed.find(x.id)-->
# <!--  return the feed id's to the rails app-->
# <!--  itterate over the feed id's and find the user if of those feeds-->
# <!-- y.each do |subsctioions| y.uid -->
#   <!--  with those id's send a api request to instagram-->
#   <!--  pass the uid to the aip call-->
#   <!--  instagram returns a hash with images to the rails app-->
#   <!--  set this hash to @images-->
#   <!--  itterate over @images with image_tag's to display pics on the view-->
#
