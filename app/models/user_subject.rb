class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :course_subject

  enum status: {joined: 0, active: 1, finished: 2}
end
