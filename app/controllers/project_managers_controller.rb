class ProjectManagersController < ApplicationController
  before_action :load_project, only: :create
  before_action :load_user, only: :create

  def create
    if ProjectManager.create project_id: @project.id, user_id: @user.id
      flash[:success] = "Thêm thành công nhân viên " + @user.name + " vào dự án."
    else
      flash[:danger] = "Thêm nhân viên thất bại."
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
end
