class UsersController < ApplicationController
  def index
  end



  def show
    @user = Users.find(session[:user_id])
  end


end
