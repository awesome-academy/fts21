class NoticeMailerPreview < ActionMailer::Preview
  def assign_trainee_preview
    NoticeMailer.assign_trainee User.all, Course.first
  end

  def remove_trainee_preview
    NoticeMailer.remove_trainee UserCourse.first
  end
end
