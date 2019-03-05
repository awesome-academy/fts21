class Trainee::CoursesController < TraineeController
  before_action :load_course, only: :show

  def index
    @courses_active = current_user.user_courses.includes(:course).active
    @courses_joined = current_user.user_courses.includes(:course).joined
  end

  private

  def load_course
    @course = Course.find_by id: params[:id]
    @course || render(file: "public/404.html", status: 404, layout: true)
  end
end
