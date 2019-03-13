class RemoveTraineeWorker
  include Sidekiq::Worker

  def perform user_course
    NoticeMailer.remove_trainee(user_course).deliver_now
  end
end
