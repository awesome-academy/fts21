class CoursesController < ApplicationController
  before_action :logged_in_supervisor
  before_action :load_course, except: %i(index new create)
  before_action :users_have_course_active, only: :start
  before_action :load_users_subjects, only: %i(new create edit update)
  before_action :load_trainees, :load_course_subjects, only: :show
  before_action :check_trainee_on_course, only: :delete_trainee

  def index
    @courses = Course.newest.paginate page: params[:page],
      per_page: Settings.pagination.per_page
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t("courses.success")
      activity_log current_user, @course, t("activities.create")
      redirect_to course_path @course
    else
      flash.now[:danger] = t("courses.fail")
      render :new
    end
  end

  def edit; end

  def update
    if @course.update_attributes course_params
      flash[:success] = t("courses.success")
      redirect_to course_path @course
    else
      flash.now[:danger] = t("courses.fail")
      render :edit
    end
  end

  def destroy; end

  def start
    if @course.active?
      flash[:danger] = t("courses.course_active")
    elsif @course.close?
      flash[:danger] = t("courses.course_close")
    elsif @course.trainees.none?
      flash[:danger] = t("courses.no_trainee")
    elsif @course.course_subjects.none?
      flash[:danger] = t("courses.no_subject")
    elsif (@list_ids = @course.trainee_ids & @user_ids).any?
      users = User.by_ids(@list_ids).pluck :name
      flash[:warning] = t("courses.more_courses_active")
      flash[:danger] = users.to_s
    else
      update_course_user_subject
      activity_log current_user, @course, t("activities.start")
    end
    redirect_to @course
  end

  def finish
    if @course.active?
      begin
        transaction_update_course
        flash[:success] = t "courses.finish_success"
        activity_log current_user, @course, t("activities.finish")
      rescue StandardError => ex
        flash[:danger] = ex
      end
    else
      flash[:danger] = t "courses.finish_course_not_allow"
    end
    redirect_to @course
  end

  def assign_trainee
    @users = User.not_exit_on_course @course
    respond_to do |format|
      format.js
    end
  end

  def add_trainee
    if @course.ready?
      begin
        trainee_ids = params[:trainee_ids].map(&:to_i) - @course.trainee_ids
        ActiveRecord::Base.transaction do
          trainee_ids.each do |trainee_id|
            @course.user_courses.create! user_id: trainee_id
          end
        end
        render json: User.with_id_name(trainee_ids)
      rescue StandardError => ex
        render json: {error: ex}
      end
    else
      render json: {error: t("courses.not_allow_add_member")}
    end
  end

  def delete_trainee
    ActiveRecord::Base.transaction do
      @course.course_subjects.each do |course_subject|
        course_subject.user_subjects
                      .by_user(@trainee.user_id).destroy_all
      end
      @trainee.destroy!
    end
    render json: {success: t("courses.delete_trainee_success")}
  rescue StandardError => ex
    render json: {error: ex}
  end

  private

  def course_params
    params.require(:course).permit :name, :description, :date_start, :date_end,
      :suppervisor_id, subject_ids: []
  end

  def load_course
    @course = Course.includes(subjects: :tasks).find_by id: params[:id]
    @course || render(file: "public/404.html", status: 404, layout: true)
  end

  def users_have_course_active
    @user_ids = UserCourse.active.pluck :user_id
  end

  def load_users_subjects
    @subjects = Subject.alphabet
    @users = User.alphabet
  end

  def update_course_user_subject
    ActiveRecord::Base.transaction do
      course_subject_ids = @course.course_subjects.pluck(:id).map{|id| {course_subject_id: id, status: :joined}}
      @course.active!
      @course.user_courses.update_all status: :active
      @course.trainees.each do |trainee|
        trainee.user_subjects.create! course_subject_ids
      end
    end
    flash[:success] = t("courses.start_success")
  rescue StandardError => ex
    flash[:danger] = ex
  end

  def load_trainees
    @trainees = @course.trainees.paginate page: params[:page],
      per_page: Settings.pagination.per_page
  end

  def load_course_subjects
    @course_subjects = @course.course_subjects.includes(subject: :tasks).paginate page: params[:page],
      per_page: Settings.pagination.per_page
  end

  def transaction_update_course
    ActiveRecord::Base.transaction do
      @course.close!
      @course.user_courses.update_all status: :finished
      @course.course_subjects.update_all status: :finished
      @course.course_subjects.each do |course_subject|
        course_subject.user_subjects.update_all status: :finished
        course_subject.user_subjects.each do |user_subject|
          user_subject.user_tasks.update_all status: :finished
        end
      end
    end
  end

  def check_trainee_on_course
    @trainee = UserCourse.find_by user_id: params[:user_id], course_id: @course.id
    return if @trainee
    redirect_with_format(t("courses.not_user_on_course"))
  end
end
