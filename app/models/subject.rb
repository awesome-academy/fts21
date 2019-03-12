class Subject < ApplicationRecord
  belongs_to :suppervisor, class_name: User.name
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
  has_many :activities, as: :target, dependent: :destroy

  validates :name, presence: true,
    length: {minimum: Settings.subject.name_min_length}
  validates :time_day, numericality: {greater_than: Settings.subject.day_min}

  scope :alphabet, ->{order name: :asc}
  scope :newest, ->{order created_at: :desc}

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc{|attributes| attributes["name"].blank?}
end
