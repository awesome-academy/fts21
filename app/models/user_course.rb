class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum status: {joined: 0, active: 1, finished: 2}

  scope :active, ->{where status: :active}
end
