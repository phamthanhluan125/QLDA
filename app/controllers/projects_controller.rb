class ProjectsController < ApplicationController
  before_action :load_project, only: [:update, :show]

  def index
    @projects = Project.of_admin current_admin.id
  end

  def new
  end

  def show
    @user_projects = ProjectManager.of_project(@project.id)
    @users_not_project = User.not_ids @user_projects.map(&:user_id)
    @tasks = @project.tasks
    @task_managers = TaskManager.by_ids @tasks.map(&:id)
  end

  def update
    if @project.update_attributes project_params
      flash[:success] = "Cập nhật thông tin dự án thành công!"
    else
      flash[:danger] = "Cập nhật thông tin dự án thất bại!"
    end
    redirect_to projects_path
  end

  def create
    project = Project.new project_params
    if project.save
      flash[:success] = "Tạo thành công dự án: " + project.name
    else
      flash[:danger] = "Tạo dự án thất bại!"
    end
    redirect_to new_project_path
  end

  private
  def new_project_params
    params.require(:project).permit(:name, :info, :start_date, :deadline).merge admin_id: current_admin.id
  end

  def project_params
    params.require(:project).permit :name, :info, :start_date, :deadline
  end

  def load_project
    @project = Project.find_by id: params[:id]
    unless @project.present?
      flash[:danger] = "Không tìm thấy dự án."
      redirect_to projects_path
    end
  end
end
