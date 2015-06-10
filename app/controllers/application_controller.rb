class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def save_authencticated_admin(admin)
    session[:admin_id] = admin.id
  end

  def current_user
    @admin ||= Admin.find_by(id: session[:admin_id])
  end
end
