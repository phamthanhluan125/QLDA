class TimesheetsController < ApplicationController
  before_action :load_timesheet, only: :show

  def index
    @projects = current_manager.projects
    if params[:user_id].present?
      @timesheets = Timesheet.all.by_user_id params[:user_id]
    elsif params[:project_id].present?
      project = Project.find_by id: params[:project_id]
      project.users.size > 0 ? @users = project.users : @users = []

      @timesheets = Timesheet.all.by_project_id params[:project_id]
    else
      @users = current_manager.users
      @timesheets = Timesheet.all.by_project_id current_manager.projects.map &:id
    end
    file_name = I18n.l(DateTime.now, format: :long).to_s
    respond_to do |format|
      format.js
      format.html
      format.xls do
        headers["Content-Disposition"] = "attachment; filename=\"#{file_name}.xls\""
        headers["Content-Type"] ||= Settings.xls
      end
    end
  end

  def show
    @scrs = @timesheet.screenshots
    respond_to do |format|
      format.js
    end
  end

  def load_timesheet
    @timesheet = Timesheet.find_by id: params[:id]
    unless @timesheet.present?
      flash[:danger] = "Không tìm thấy phiên làm việc này."
      redirect_to root_path
    end
  end
end
