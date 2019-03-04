class CourseSubjectsController < ApplicationController
  before_action :logged_in_supervisor, :load_course_subject,
    :load_subject, :load_tasks, :load_courses

  def show; end

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
