module ApplicationHelper
  def load_status_model item
    case
    when item.pending?
      label_tag "stattus", "Chưa bắt đầu", class: "btn btn-info btn-xs"
    when item.running?
      label_tag "stattus", "Đang diễn ra", class: "btn btn-success btn-xs"
    when item.delay?
      label_tag "stattus", "Chậm tiến độ", class: "btn btn-warning btn-xs"
    when item.finish?
      label_tag "stattus", "Đã hoàn thành", class: "btn btn-primary btn-xs"
    when item.cancel?
      label_tag "stattus", "Đã hủy", class: "btn btn-danger btn-xs"
    end
  end

  def check_btn_edit item
    if item.finish? || item.cancel?
      return "disabled"
    end
  end

  def check_btn_delete item
    unless item.pending?
      return "disabled"
    end
  end

  def check_btn_finish object
    case
    when object.class.name == "Task"
      unless !object.pending? && !object.finish? && !object.cancel? && object.task_managers.size == (object.task_managers.finish.size + object.task_managers.cancel.size)
        return "disabled"
      end
    when object.class.name == "TaskManager"
      unless !object.pending? && !object.finish? && !object.cancel?
        return "disabled"
      end
    end
  end

  def load_color_header item
    case
    when item.pending?
      "blue"
    when item.running?
      "green"
    when item.delay?
      "orange"
    when item.finish?
      "purple"
    when item.cancel?
      "red"
    end
  end

  def total_timesheets timesheets
    count = 0
    timesheets.each do |t|
      count += (t.end - t.start)
    end
    count
  end
end
