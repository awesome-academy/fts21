class Trainee::UserCoursesController < TraineeController
  before_action :load_user_course, only: :show
  authorize_resource

  def show
    @course = @user_course.course
    @course_subjects = @course.course_subjects.includes :subject
    @trainees = @user_course.course.trainees.paginate page: params[:page],
      per_page: Settings.pagination.per_page
  end

  private
  def load_user_course
    @user_course = UserCourse.find_by id: params[:id]
    @user_course || render(file: "public/404.html", status: 404, layout: true)
  end
end
