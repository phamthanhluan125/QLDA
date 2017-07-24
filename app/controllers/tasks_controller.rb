class TasksController < ApplicationController
  before_action :load_task, only: :update

  def index
    @projects = Project.of_admin current_admin.id
    if @projects.present?
      if params[:choose_id].present?
        @choose_project = Project.find_by id: params[:choose_id]
        unless @choose_project.present?
          flash[:danger] = "Load lỗi!!!"
          redirect_to root_path
        end
      else
        @choose_project = @projects.first
      end
      @tasks = Task.of_project @choose_project.id
    end
  end

  def update
    if @task.update_attributes task_params
      flash[:success] = "Cập nhật thông tin task thành công!"
    else
      flash[:danger] = "Cập nhật thông tin task thất bại!"
    end
    redirect_to tasks_path
  end

  def create
    binding.pry
    task = Task.new new_task_params
    if task.save
      flash[:success] = "Tạo thành công task: " + task.name
    else
      flash[:danger] = "Tạo task thất bại!"
    end
    redirect_to tasks_path
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
      redirect_to tasks_path
    end
  end
end
