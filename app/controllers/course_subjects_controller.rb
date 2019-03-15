class CourseSubjectsController < ApplicationController
  before_action :load_course_subject
  authorize_resource
  before_action :load_subject, :load_tasks, :load_courses

  def show; end

  def start
    if @course_subject.joined? && @course_subject.course.active?
      begin
        ActiveRecord::Base.transaction do
          dead_line = Time.now + @course_subject.subject.time_day.days
          @course_subject.update_attributes! date_start: Time.now,
            date_end: dead_line, status: :active
          @course_subject.user_subjects.update_all status: :active
        end
        flash[:success] = t "course_subjects.start_success"
      rescue StandardError => ex
        flash[:danger] = ex
      end
    else
      flash[:danger] = t "course_subjects.not_accepted"
    end
    redirect_to @course_subject
  end

  def finish
    if @course_subject.active? && @course_subject.course.active?
      begin
        ActiveRecord::Base.transaction do
          @course_subject.finished!
          @course_subject.user_subjects.update_all status: :finished
          @course_subject.user_subjects.each do |u_s|
            u_s.user_tasks.update_all status: :finished, finish_at: Time.now
          end
        end
        flash[:success] = t "course_subjects.finish_success"
      rescue StandardError => ex
        flash[:danger] = ex
      end
    else
      flash[:danger] = t "course_subjects.not_accepted"
    end
    redirect_to @course_subject
  end

  private

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
    @course_subject || redirect_with_format((t "subjects.not_found"))
  end

  def load_subject
    @subject = @course_subject.subject
  end

  def load_tasks
    @tasks = @subject.tasks.newest.paginate page: params[:page],
      per_page: Settings.pagination.per_page
  end

  def load_courses
    @courses = @subject.courses.newest.paginate page: params[:page],
      per_page: Settings.pagination.per_page
  end
end
