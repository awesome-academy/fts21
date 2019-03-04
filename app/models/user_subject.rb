class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :course_subject
  has_many :user_tasks

  enum status: {joined: 0, active: 1, finished: 2}
end
