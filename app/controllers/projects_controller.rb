class ProjectsController < ApplicationController
  before_action :authenticate_manager!
  before_action :load_project, only: [:update, :show, :edit]

  def index
    @projects = Project.of_manager current_manager.id
  end

  def new
  end

  def edit
    case
    when params[:type] == Settings.update.finish
      if (@project.tasks.finish.size + @project.tasks.cancel.size) == @project.tasks.size
        if @project.update_attributes status: :finish, finish_date: Date.today
          flash[:success] = "Đã đánh dấu hoàn thành."
        else
          flash[:danger] = "Thất bại"
        end
      else
        flash[:danger] = "Không thể đánh dấu hoàn thành khi vẫn còn #{@project.tasks.size - @project.tasks.finish.size + @project.tasks.cancel.size} công việc chưa được hoàn thành."
      end
    when params[:type] == Settings.update.cancel
      if @project.update_attributes status: :cancel, finish_date: Date.today
        flash[:success] = "Hủy thành công."
      else
        flash[:danger] = "Thất bại"
      end
    end
    redirect_to project_path(@project.id)
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
      project = Project.new new_project_params
    if project.save
      flash[:success] = "Tạo thành công dự án: " + project.name
    else
      flash[:danger] = "Tạo dự án thất bại!"
    end
    redirect_to new_project_path
  end

  private
  def new_project_params
    params.require(:project).permit(:name, :info, :start_date, :deadline).merge manager_id: current_manager.id
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
