class SessionsController < ApplicationController


  # def create
  #   @user = User.find_or_create_from_auth_hash(auth_hash)
  #   self.current_user = @user
  #   redirect_to root_path
  # end
  #
  # def find_or_create_from_auth_hash(auth_hash)
  #
  # end

  def create
    auth_hash = request.env['omniauth.auth']



    if auth_hash["uid"]
       @user = find_or_create_from_omniauth(auth_hash)
       session[:user_id] = @user.id
       redirect_to root_path
    end
    redirect_to root_path
  end


  def find_or_create_from_omniauth(auth_hash)
    if  auth_hash["uid"] == Oauth.find_by(uid:auth_hash["uid"])
      @user = Oauth.find_by(uid: auth_hash["uid"]) >>
    else
      Oauth.create(provider:auth_hash["provider"], name:auth_hash["info"]["nickname"], user_id: new_user_id)
      @user = Oauth.find_by(uid: auth_hash["uid"])
    end


    # Find or create a user
  end

  def new_user_id
    @user = User.create()
    @user.id

  end


 protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
