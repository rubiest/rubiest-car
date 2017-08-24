module ApplicationHelper
  def check_status(obj)
    case obj.status
    when "available"
      "<span class='badge badge-success'>#{obj.status}</span>".html_safe
    when "in_use"
      "<span class='badge badge-warning'>#{obj.status}</span>".html_safe
    when "not_available"
      "<span class='badge badge-danger'>#{obj.status}</span>".html_safe
    else
      "<span class='badge badge-primary'>#{obj.status}</span>".html_safe
    end
  end
end
