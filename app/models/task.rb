class Task < ApplicationRecord
  belongs_to :subject
  has_many :user_tasks, dependent: :destroy

  validates :name, presence: true,
    length: {minimum: Settings.task.name_min_length}

  scope :newest, ->{order created_at: :desc}
end
