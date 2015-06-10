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

  helper_method :current_user

  private

  def authenticate_user
    unless session[:admin_id].present? && current_user.present?
      flash[:alert] = 'Sorry, gotta be logged in to do that!'
      redirect_to login_path
    end
  end

end
