class ApplicationController < ActionController::Base
  private

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

  def activity_log user, target, action_type
    user.activities.create target: target, action_type: action_type
  end

  def after_sign_in_path_for _resource
    current_user.trainee? ? trainee_root_path : courses_path
  end
end
