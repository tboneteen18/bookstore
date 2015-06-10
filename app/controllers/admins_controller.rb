class AdminsController < ApplicationController

  def create
    @admin = Admin.new(params[:username])
    @admin.password = params[:password]
    if @admin.save
      give_token
      flash[:notice] = 'You are logged in'
      redirect_to book_path
    else
      render :new
    end
  end

  def index

  end

  def show

  end

  def login
    @admin = Admin.find_by_username(params[:username])
    if @admin.password == params[:password]
      give_token
      redirect_to books_path
    else
      redirect_to admins_path
    end
  end

  def new
    @admin = Admin.new

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
end
