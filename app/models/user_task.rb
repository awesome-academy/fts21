class UserTask < ApplicationRecord
  belongs_to :task
  belongs_to :user_subject

  enum status: {received: 0, finished: 1, expired: 2}
  scope :task_in_user_tasks, ->{select("task_id")}
  delegate :name, :description, to: :task, allow_nil: true
end
