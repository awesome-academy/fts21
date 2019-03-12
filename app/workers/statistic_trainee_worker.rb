class StatisticTraineeWorker
  include Sidekiq::Worker

  def perform
    @user_courses = UserCourse.active.group(:course_id).includes :course
    @user_courses.each do |user_course|
      NoticeMailer.statistic_trainee(user_course).deliver_now
    end
  end
end
