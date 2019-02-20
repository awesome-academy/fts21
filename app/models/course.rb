class Course < ApplicationRecord
  belongs_to :suppervisor, class_name: User.name
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
end
