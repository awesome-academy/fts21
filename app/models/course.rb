class Course < ApplicationRecord
  belongs_to :suppervisor, class_name: User.name
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :user_courses, dependent: :destroy
  has_many :trainees, through: :user_courses, source: :user

  validates :name, presence: true,
    length: {minimum: Settings.course.name_min_length}
  validate :end_time_is_valid

  enum status: {ready: 0, active: 1, close: 2}

  scope :newest, ->{order created_at: :desc}

  def end_time_is_valid
    return if date_start.blank? || date_end.blank?
    error_msg = I18n.t("courses.date_end_earlier_start")
    errors.add(:date_end, error_msg) if date_end < date_start
  end
end
