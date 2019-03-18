class Trainee::UserSubjectsController < TraineeController
  before_action :load_user_subject
  authorize_resource

  def finish
    if @user_subject.joined?
      flash[:danger] = t "user_subjects.not_active"
    elsif @user_subject.finished?
      flash[:danger] = t "user_subjects.finished"
    else
      update_finish_user_subject @user_subject
    end
    redirect_to trainee_course_subject_path @user_subject.course_subject
  end

  private

  def load_user_subject
    @user_subject = UserSubject.find_by id: params[:id]
    @user_subject || render(file: "public/404.html", status: 404, layout: true)
  end
end
