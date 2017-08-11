class TimesheetsController < ApplicationController
  def index
    # binding.pry
    @projects = current_admin.projects
    if params[:user_id].present?
      @timesheets = Timesheet.all.by_user_id params[:user_id]
    elsif params[:project_id].present?
      project = Project.find_by id: params[:project_id]
      project.users.size > 0 ? @users = project.users : @users = []

      @timesheets = Timesheet.all.by_project_id params[:project_id]
    else
      @users = current_admin.users
      @timesheets = Timesheet.all.by_project_id current_admin.projects.map &:id
    end
    respond_to do |format|
      format.js
      format.html
    end
  end
end
