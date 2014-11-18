class SessionsController < ApplicationController

  def create
    #find or create a user here
    #sign the user in
    redirect_to root_path
  end

end
