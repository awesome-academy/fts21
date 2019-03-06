class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum status: {joined: 0, active: 1, finished: 2}
  delegate :name, :date_start, :date_end,
    :description, to: :course, allow_nil: true
end
