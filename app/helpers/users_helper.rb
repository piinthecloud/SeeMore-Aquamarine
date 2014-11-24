module UsersHelper


  def session_user
    session[:user_id]
  end


  def github_authenticated
    Oauth.where(user_id: session_user).where("provider ILIKE ?", "github").exists?


  end

  def twitter_authenticated
    Oauth.where(user_id: session_user).where("provider ILIKE ?", "twitter").exists?

  end

  def vimeo_authenticated
    Oauth.where(user_id: session_user).where("provider ILIKE ?", "vimeo").exists?
  end

  def instagram_authenticated
    Oauth.where(user_id: session_user).where("provider ILIKE ?", "instagram").exists?

  end
end
