class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
  has_many :user_subjects, dependent: :destroy
  has_many :subjects, through: :user_subjects
  has_many :activities, dependent: :destroy

  validates :email,
    length: {maximum: Settings.user.email_max_length},
    format: {with: VALID_EMAIL_REGEX},
    presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password_min_length},
    allow_nil: true
  validates :name, presence: true,
    length: {minimum: Settings.user.name_min_length}

  before_save :downcase_email

  enum group: [:trainee, :suppervisor]

  scope :alphabet, ->{order name: :asc}
  scope :by_ids, ->(ids){where id: ids}
  scope :not_exit_on_course, ->(course_id){where("id not in (?)", UserCourse.select("user_id").where(course_id: course_id))}
  scope :with_id_name, ->{select(:id, :name)}

  devise :database_authenticatable, :registerable, :rememberable,
    :validatable, :omniauthable, omniauth_providers: %i(google_oauth2)

  private

  def downcase_email
    self.email = email.downcase
  end
end
