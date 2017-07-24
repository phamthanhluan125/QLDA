module StaffsHelper
  def load_status staff
    if staff.active?
      label_tag "stattus", "Hoạt động", class: "btn btn-success btn-xs"
    else
      label_tag "stattus", "Khóa", class: "btn btn-warning btn-xs"
    end
  end
end
