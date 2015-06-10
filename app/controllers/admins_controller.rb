class AdminsController < ApplicationController
  def signup

    @admin = Admin.find_by(username: params[:username])
    if @admin.authenticate(params[:password])
      save_authencticated_admin(@admin)
      # remember this user has been authenticated
      # send user to logged in section
    else
      # take them back to the login page
    end
  end
end
