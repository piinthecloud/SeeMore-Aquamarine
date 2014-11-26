class SessionsController < ApplicationController



  def create
    if auth_hash["uid"]
       @user = find_or_create_from_omniauth
       session[:user_id] = @user.user_id
       redirect_to root_path

    end
  end

  def add_user_name
    auth_hash["info"]["nickname"]
  end


  def find_or_create_from_omniauth

    if Oauth.find_by(uid:auth_hash["uid"])
      Oauth.find_by(uid: auth_hash["uid"])
    else
      Oauth.create(provider:auth_hash["provider"], name: auth_hash["info"]["nickname"], uid: auth_hash["uid"], user_id: new_user_id)
      Oauth.find_by(uid: auth_hash["uid"])
    end
  end

  def new_user_id
    if session[:user_id]
      session[:user_id]
    else
      @user = User.create(name: add_user_name)
      @user.id
    end

  end

  def log_out
    session.delete(:user_id)
    @user = nil
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def my_account
    # @current_user = User.find(id: session[:user_id])
    # @feeds = @current_user.feeds
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

end
