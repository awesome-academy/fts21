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
    return if current_user&.suppervisor?
    flash[:danger] = t "sessions.not_access"
    redirect_to root_path
  end

  def redirect_to_root
    flash[:danger] = t "sessions.logged"
    redirect_to root_path
  end

  def redirect_with_format mess
    flash[:danger] = mess
    if request.xhr?
      render js: "window.location.href='"+root_path+"'"
    else
      redirect_to root_path
    end
  end

  def update_finish_user_subject user_subject
    UserSubject.transaction do
      user_subject.finished!
      user_subject.user_tasks.update_all status: :finished, finish_at: Time.now
    end
    flash[:success] = t "user_subjects.finish_success"
  rescue StandardError => ex
    flash[:warning] = ex
    flash[:danger] = t "user_subjects.finish_fail"
  end
end
