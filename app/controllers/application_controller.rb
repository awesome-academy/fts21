class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "users.logged_in_user.mess_error"
      redirect_to login_path
    end
  end

  def logged_in_supervisor
    return if current_user&.suppervisor
    flash[:danger] = t "sessions.not_access"
    redirect_to root_path
  end

  def redirect_to_root
    flash[:danger] = t "sessions.logged"
    redirect_to root_path
  end
end
