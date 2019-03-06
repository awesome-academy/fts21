class Trainee::CourseSubjectsController < TraineeController
  before_action :load_course_subject, :load_user_subject,
    :load_user_tasks, :load_subject, :load_tasks, only: :show

  def show; end

  private

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
    @course_subject || redirect_with_format((t "subjects.not_found"))
  end

  def load_user_subject
    @user_subject = UserSubject.find_by course_subject_id: @course_subject.id, user_id: current_user.id
    @user_subject || redirect_with_format((t "course_subjects.not_active"))
  end

  def load_user_tasks
    @user_subject_tasks_doing = @user_subject.user_tasks
  end

  def load_subject
    @subject = @course_subject.subject
  end

  def load_tasks
    @report_tasks = @subject.tasks.not_exit_in_user_task
  end
end
