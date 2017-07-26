class TasksController < ApplicationController
  before_action :load_task, only: [:update, :destroy, :edit]
  before_action :load_project, only: :create

  def update
    if @task.update_attributes task_params
      flash[:success] = "Cập nhật thông tin task thành công!"
    else
      flash[:danger] = "Cập nhật thông tin task thất bại!"
    end
    redirect_to project_path(@task.project_id)
  end

  def create
    binding.pry
    task = Task.new new_task_params
    if task.save
      flash[:success] = "Tạo thành công task: " + task.name
    else
      flash[:danger] = "Tạo task thất bại!"
    end
    redirect_to project_path(@project.id)
  end

  def destroy
    if @task.pending?
      if @task.task_managers.size != 0
        flash[:danger] = "Không thể xóa vì task này đã được phân công cho #{@task.task_managers.size} thành viên."
      else
        if @task.destroy
          flash[:success] = "Xóa thành công."
        else
          flash[:danger] = "Xóa thất bại."
        end
      end
    else
      flash[:danger] = "Chỉ được xóa khi công việc được phân công chưa bắt đầu."
    end
    redirect_to project_path(params[:project_id])
  end

  def edit
    case
    when params[:type] == Settings.update.finish
      if @task.update_attributes status: :finish, finish_date: Date.today
        flash[:success] = "Đã đánh dấu hoàn thành."
      else
        flash[:danger] = "Thất bại"
      end
    when params[:type] == Settings.update.cancel
      if @task.update_attributes status: :finish, finish_date: Date.today
        flash[:success] = "Hủy thành công."
      else
        flash[:danger] = "Thất bại"
      end
    end
    redirect_to project_path(params[:project_id])
  end

  private
  def new_task_params
    params.require(:task).permit :name, :info, :start_date, :deadline, :project_id
  end

  def task_params
    params.require(:task).permit :name, :info, :start_date, :deadline
  end

  def load_task
    @task = Task.find_by id: params[:id]
    unless @task.present?
      flash[:danger] = "Không tìm thấy task."
      redirect_to project_path(@project.id)
    end
  end

  def load_project
    @project = Project.find_by id: params[:task][:project_id]
    unless @project.present?
      flash[:danger] = "Không tìm thấy dự án."
      redirect_to projects_path
    end
  end
end
