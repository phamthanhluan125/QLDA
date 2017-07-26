class StaticPagesController < ApplicationController
layout "login", only: :login
  def index
    redirect_to login_path if !admin_signed_in?
    load_data_project_chart
    load_data_task_chart
  end

  def login
    redirect_to new_admin_session_path
  end

  private
  def load_data_project_chart
    all = current_admin.projects
    count_all = all.size * 1.0
    @project_chart = []
    @project_chart << {name: "Chưa bắt đầu", y: all.pending.size / count_all,
    count: all.pending.size }
    @project_chart << {name: "Đang diễn ra", y: all.running.size / count_all,
    count: all.running.size }
    @project_chart << {name: "Đã hoàn thành", y: all.finish.size / count_all,
    count: all.finish.size }
    @project_chart << {name: "Chậm tiến độ", y: all.delay.size / count_all,
    count: all.delay.size }
    @project_chart << {name: "Đã hủy", y: all.cancel.size / count_all,
    count: all.cancel.size }
  end

  def load_data_task_chart
    all = Task.of_project current_admin.projects.map(&:id)
    count_all = all.size * 1.0
    @task_chart = []
    @task_chart << {name: "Chưa bắt đầu", y: all.pending.size / count_all,
    count: all.pending.size }
    @task_chart << {name: "Đang diễn ra", y: all.running.size / count_all,
    count: all.running.size }
    @task_chart << {name: "Đã hoàn thành", y: all.finish.size / count_all,
    count: all.finish.size }
    @task_chart << {name: "Chậm tiến độ", y: all.delay.size / count_all,
    count: all.delay.size }
    @task_chart << {name: "Đã hủy", y: all.cancel.size / count_all,
    count: all.cancel.size }
  end
end
