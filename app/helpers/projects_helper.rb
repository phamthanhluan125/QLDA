module ProjectsHelper
  def check_btn_finish_project project
    if (project.tasks.finish.size + project.tasks.cancel.size) == project.tasks.size
      link_to "Đánh dấu hoàn thành", tasks_path(choose_id: project.id),
        class: "btn btn-primary form-group margin-0"
    else
      link_to "Đánh dấu hoàn thành", "javascript:",
        class: "btn btn-primary form-group margin-0 btn-finish-project-error"
    end
  end

  def check_btn_cancel_project project
    if project.pending?
       link_to "Hủy dự án", tasks_path(choose_id: project.id),
        class: "btn btn-primary form-group margin-0"
    else
      link_to "Hủy dự án", "javascript:",
        class: "btn btn-primary form-group margin-0 btn-cancel-project-error"
    end
  end
end
