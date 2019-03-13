class AssignTraineeWorker
  include Sidekiq::Worker

  def perform users, course
    NoticeMailer.assign_trainee(users, course).deliver_now
  end
end
