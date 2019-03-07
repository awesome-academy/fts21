class Trainee::TasksController < TraineeController
  before_action :load_user_subject, :correct_user,
    :load_course_subject, :load_subject, :load_task,
    :check_user_subject_active, :load_user_task, only: %i(report finish)

  def report
    if @user_task
      flash[:danger] = t "user_subjects.task.reported"
    else
      @new_user_task = @user_subject.user_tasks.build task_id: @task.id, status: :received
      if @new_user_task.save
        flash[:success] = t "user_subjects.task.report_success"
      else
        flash[:danger] = t "user_subjects.task.report_fail"
      end
    end
    redirect_to trainee_course_subject_path @course_subject
  end

  def finish
    if @user_task&.received?
      begin
        transaction_update_user_task
      rescue StandardError => ex
        flash[:warning] = ex
        flash[:danger] = t "user_subjects.task.finish_fail"
      end
    else
      flash[:danger] = t "user_subjects.task.not_accepted"
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
  end

  def load_course_subject
    @course_subject = @user_subject.course_subject
  end

  def load_subject
    @subject = @course_subject.subject
  end

  def check_user_subject_active
    return if @user_subject.active?
    flash[:danger] = t "user_subjects.task.cant_report"
    redirect_to trainee_course_subject_path @course_subject
  end

  def transaction_update_user_task
    ActiveRecord::Base.transaction do
      @user_task.update_attributes finish_at: Time.now, status: :finished
      if @user_subject.user_tasks.finished.size == @subject.tasks.size
        @user_subject.finished!
        @user_subject.user_tasks.update_all status: :finished, finish_at: Time.now
      end
    end
    flash[:success] = t "user_subjects.task.finish_success"
  end
end
