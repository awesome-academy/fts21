class Task < ApplicationRecord
  belongs_to :subject
  has_many :user_tasks, dependent: :destroy
  has_many :activities, as: :target, dependent: :destroy

  validates :name, presence: true,
    length: {minimum: Settings.task.name_min_length}

  scope :newest, ->{order created_at: :desc}
  scope :not_exit_in_user_task, ->(user_subject){where("id not in (?)", UserTask.task_in_user_tasks(user_subject))}
  scope :of_subjects, ->(ids){where subject_id: ids}

  acts_as_paranoid
end
