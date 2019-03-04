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

  def status_course_subject_item course_subject
    return "list-group-item-primary" if course_subject.joined?
    return "list-group-item-info" if course_subject.active?
    return "list-group-item-success" if course_subject.finished?
  end

  def status_course_subject_bg course_subject
    return "bg-primary" if course_subject.joined?
    return "bg-info" if course_subject.active?
    return "bg-success" if course_subject.finished?
  end

  def course_subject_status_badge course_subject
    return "badge badge-primary" if course_subject.joined?
    return "badge badge-info" if course_subject.active?
    return "badge badge-success" if course_subject.finished?
  end

  def status_course status
    status ? "active" : "closed"
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
end
