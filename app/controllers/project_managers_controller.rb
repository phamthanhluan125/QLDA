class ProjectManagersController < ApplicationController
  before_action :authenticate_admin!
  before_action :load_project, only: [:create, :destroy]
  before_action :load_user, only: :create
  before_action :load_project_manager, only: :destroy

  def create
    if ProjectManager.create project_id: @project.id, user_id: @user.id
      flash[:success] = "Thêm thành công nhân viên " + @user.name + " vào dự án."
    else
      flash[:danger] = "Thêm nhân viên thất bại."
    end
    redirect_to project_path(@project.id)
  end

  def destroy
    task_of_user = TaskManager.by_ids(@project.tasks.map(&:id)).of_user(@project_manager.user_id)
    if task_of_user.size == 0
      if @project_manager.destroy
        flash[:success] = "Xóa nhân viên thành công."
      else
        flash[:danger] = "Xóa nhân viên thất bại."
      end
    else
      flash[:danger] = "Chỉ có thể xóa khi nhân viên chưa làm công việc nào của dự án."
    end
    redirect_to project_path(@project.id)
  end

  private
  def load_project
    @project = Project.find_by id: params[:project_id]
    unless @project.present?
      flash[:danger] = "Không tìm thấy dự án."
      redirect_to root_path
    end
  end

  def load_user
    @user = User.find_by id: params[:user_id]
    unless @user.present?
      flash[:danger] = "Không tìm thấy nhân viên."
      redirect_to root_path
    end
  end

  def load_project_manager
    @project_manager = ProjectManager.find_by id: params[:id]
    unless @project_manager.present?
      flash[:danger] = "Không tìm thấy."
      redirect_to project_path(params[:project_id])
    end
  end
end
