class TaskManagersController < ApplicationController
  before_action :authenticate_admin!
  before_action :load_project, only: :create
  before_action :load_user, only: :create
  before_action :load_task, only: :create
  before_action :load_task_manager, only: [:update, :destroy, :edit]

  def create
    if TaskManager.create new_task_manager_params
      flash[:success] = "Đã phân công công việc " + @task.name + " cho nhân viên " + @user.name
    else
      flash[:danger] = "Phân công công việc thất bại."
    end
    redirect_to project_path(@project.id)
  end

  def update
    if @task_manager.update_attributes task_manager_params
      flash[:success] = "Cập nhật thành công."
    else
      flash[:danger] = "Cập nhật thất bại."
    end
    redirect_to project_path(params[:project_id])
  end

  def destroy
    if @task_manager.pending?
      if @task_manager.destroy
        flash[:success] = "Xóa thành công."
      else
        flash[:danger] = "Xóa thất bại."
      end
    else
      flash[:danger] = "Chỉ được xóa khi công việc được phân công chưa bắt đầu."
    end
    redirect_to project_path(params[:project_id])
  end

  def edit
    case
    when params[:type] == Settings.update.finish
      if @task_manager.update_attributes status: :finish, finish_date: Date.today
        flash[:success] = "Đã đánh dấu hoàn thành."
      else
        flash[:danger] = "Thất bại"
      end
    when params[:type] == Settings.update.cancel
      if @task_manager.update_attributes status: :finish, finish_date: Date.today
        flash[:success] = "Hủy thành công."
      else
        flash[:danger] = "Thất bại"
      end
    end
    redirect_to project_path(params[:project_id])
  end

  private
  def new_task_manager_params
    params.require(:task_manager).permit :note, :start_date, :deadline, :user_id, :task_id
  end

  def task_manager_params
     params.require(:task_manager).permit :note, :start_date, :deadline
  end

  def load_task
    @task = Task.find_by id: params[:task_manager][:task_id]
    unless @task.present?
      flash[:danger] = "Không tìm thấy task."
      redirect_to project_path(@project.id)
    end
  end

  def load_task_manager
    @task_manager = TaskManager.find_by id: params[:id]
    unless @task_manager.present?
      flash[:danger] = "Không tìm thấy task."
      redirect_to project_path(params[:project_id])
    end
  end

  def load_user
    @user = User.find_by id: params[:task_manager][:user_id]
    unless @user.present?
      flash[:danger] = "Không tìm thấy nhân viên này!"
      redirect_to project_path(@project.id)
    end
  end

  def load_project
    @project = Project.find_by id: params[:project_id]
    unless @project.present?
      flash[:danger] = "Không tìm thấy dự án."
      redirect_to projects_path
    end
  end
end
