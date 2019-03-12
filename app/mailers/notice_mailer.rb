class NoticeMailer < ApplicationMailer
  def assign_trainee users, course
    @course = course
    emails = users.map(&:email).join ","
    mail to: emails, subject: t("mailers.assign_trainee.title_subject")
  end

  def remove_trainee user_course
    @user = user_course.user
    @course = user_course.course
    mail to: @user.email, subject: t("mailers.remove_trainee.title_subject")
  end
end
