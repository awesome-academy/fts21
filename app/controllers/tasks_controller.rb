class TasksController < ApplicationController
  before_action :logged_in_supervisor
  before_action :load_course_subject, :load_subject, except: :destroy
  before_action :load_task, except: %i(new create)

  def new
    @task = @subject.tasks.build
    respond_to do |format|
      format.js
    end
  end

  def create
    @task = @subject.tasks.build task_params
    respond_to do |format|
      @ers = @task.errors.full_messages unless @task.save
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @task.update_attributes task_params
        @new_task = Task.find_by id: @task.id
      else
        @ers = @task.errors.full_messages
      end
      format.js
    end
  end

  def destroy
    @old_task_id = @task.id
    respond_to do |format|
      @check_success = @task.destroy
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit :name, :description
  end

  def load_task
    @task = Task.find_by id: params[:id]
    @task || redirect_with_format(t("subjects.task.not_found"))
  end

  def load_subject
    @subject = @course_subject.subject
  end

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:course_subject_id]
    @course_subject || redirect_with_format(t("not_found"))
  end
end
