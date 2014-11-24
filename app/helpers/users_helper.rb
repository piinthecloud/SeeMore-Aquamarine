module UsersHelper

  def authenticated
    @current_user = session[:user_id]
    Oauth.where(user: @current_user, provider: "github")

  end
end
