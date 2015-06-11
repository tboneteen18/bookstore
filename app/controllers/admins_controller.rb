class AdminsController < ApplicationController

  def create
    @admin = Admin.new(user_params)
    if @admin.save
    flash[:success] = "Welcome to your Bookstore!"
    redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
  end

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

  def user_params
    params.require(:admin).permit(:username, :password,
                                  :password_confirmation)
  end


end
