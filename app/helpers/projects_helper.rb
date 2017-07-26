module ProjectsHelper
  def check_btn_finish_project project
    unless (project.tasks.finish.size + project.tasks.cancel.size) == project.tasks.size
      return "disabled"
    end
  end
end
