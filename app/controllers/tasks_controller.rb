class TasksController < ApplicationController
  before_action :load_subject, except: :destroy
  authorize_resource
  before_action :load_task, only: %i(edit update destroy)
  before_action :load_all_tasks_soft_deleted,
    only: %i(soft_deleted restore really_destroy)
  before_action :load_task_soft_deleted, only: %i(restore really_destroy)

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

  def soft_deleted
    respond_to do |format|
      format.js
    end
  end

  def restore
    @task_deleted.restore recursive: true
  rescue StandardError => ex
    @error = ex
    respond_to do |format|
      format.js
    end
  end

  def really_destroy
    @old_task_id = @task_deleted.id
    @task_deleted.really_destroy!
  rescue StandardError => ex
    @error = ex
    respond_to do |format|
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
    @subject = Subject.find_by id: params[:subject_id]
    @subject || redirect_with_format(t("subjects.not_found"))
  end

  def load_all_tasks_soft_deleted
    @tasks_deleted = @subject.tasks.only_deleted
  end

  def load_task_soft_deleted
    @task_deleted = @tasks_deleted.find_by id: params[:id]
    @task_deleted || redirect_with_format(t("subjects.task.not_found"))
  end
end
