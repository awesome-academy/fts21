class UserTask < ApplicationRecord
  belongs_to :task
  belongs_to :user_subject

  before_create :set_receive_at

  enum status: {received: 0, finished: 1, expired: 2}
  scope :task_in_user_tasks, ->(user_subject){where(user_subject: user_subject).select("task_id")}
  delegate :name, :description, to: :task, allow_nil: true

  private

  def set_receive_at
    self.receive_at = Time.now
  end
end
