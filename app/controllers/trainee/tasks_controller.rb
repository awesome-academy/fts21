class Trainee::TasksController < TraineeController
  before_action :load_user_subject, :correct_user,
    :load_course_subject, :load_subject,
    :load_task, :load_user_task, only: %i(report finish)

  def report
    if @user_subject.active?
      @new_user_task = @user_subject.user_tasks.build task_id: @task.id, status: :received
      if @new_user_task.save
        flash[:success] = t "user_subjects.task.report_success"
      else
        flash[:danger] = t "user_subjects.task.report_fail"
      end
    else
      flash[:danger] = t "user_subjects.task.cant_report"
    end
    redirect_to trainee_course_subject_path @course_subject
  end

  def finish
    if @user_subject.active?
      if @user_task.finished?
        flash[:danger] = t "user_subjects.task.finished"
      elsif @user_task.update_attributes finish_at: Time.now, status: :finished
        flash[:success] = t "user_subjects.task.finish_success"
      else
        flash[:danger] = t "user_subjects.task.finish_fail"
      end
    else
      flash[:danger] = t "user_subjects.subject_inactive"
    end
    redirect_to trainee_course_subject_path @course_subject
  end

  private

  def load_user_subject
    @user_subject = UserSubject.find_by id: params[:user_subject_id]
    @user_subject || render(file: "public/404.html", status: 404, layout: true)
  end

  def correct_user
    redirect_to root_url unless current_user? @user_subject.user
  end

  def load_task
    @task = Task.find_by id: params[:id]
    @task || render(file: "public/404.html", status: 404, layout: true)
  end

  def load_user_task
    @user_task = UserTask.find_by user_subject_id: @user_subject.id, task_id: @task
    @user_task || render(file: "public/404.html", status: 404, layout: true)
  end

  def load_course_subject
    @course_subject = @user_subject.course_subject
  end

  def load_subject
    @subject = @course_subject.subject
  end
end
