module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code code, language
      Pygments.highlight(code, lexer: language)
    end
  end

  def full_title page_title
    base_title = t "layouts.application.fts_title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def status_subject status
    status ? "list-group-item-success" : "list-group-item-light"
  end

  def status_course course
    if course.ready?
      "joined"
    elsif course.active?
      "active"
    else
      "finished"
    end
  end

  def status_course_subject_item course_subject
    if course_subject.joined?
      "list-group-item-primary"
    elsif course_subject.active?
      "list-group-item-info"
    else
      "list-group-item-success"
    end
  end

  def status_course_subject_bg course_subject
    if course_subject.joined?
      "bg-primary"
    elsif course_subject.active?
      "bg-info"
    else
      "bg-success"
    end
  end

  def course_subject_status_badge course_subject
    if course_subject.joined?
      "badge badge-primary"
    elsif course_subject.active?
      "badge badge-info"
    else
      "badge badge-success"
    end
  end

  def status_user_course user_course
    if user_course.joined?
      "joined"
    elsif user_course.active?
      "active"
    else
      "finished"
    end
  end

  def markdown content
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true, tables: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      quote: true,
      highlight: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

  def number_to_percent value, sum
    sum.zero? ? 0 : ((value.to_f / sum.to_f) * 100).round(0)
  end

  def status_stask_trainee user_task
    if user_task.received?
      "list-group-item-dark"
    elsif user_task.finished?
      "list-group-item-success"
    else
      "list-group-item-danger"
    end
  end
end
