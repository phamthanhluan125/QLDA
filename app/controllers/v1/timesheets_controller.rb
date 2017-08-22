class V1::TimesheetsController < V1::BaseController
  skip_before_filter :verify_authenticity_token, only: [:create, :update]
  before_action :load_timesheet, only: :update

  def index
    response_success "OK", Timesheet.all
  end

  def create
    if @user.projects.present?
      timesheet = Timesheet.new project_id: current_user.projects.first.id,
        user_id: current_user.id, start: DateTime.now, end: DateTime.now
      if timesheet.save
        response_success "Khởi tạo thành công.", timesheet
      else
        response_error "Khởi tạo thất bại."
      end
    else
      response_error "Bạn không thể bắt đầu khi chưa nằm trong dự án nào."
    end
  end

  def update
    if @timesheet.update_attribute :end, DateTime.now
      response_success "Cập nhật thành công.", @timesheet
    else
      response_eror "Cập nhật thất bại."
    end
  end

  private
  def load_timesheet
    @timesheet = Timesheet.find_by id: params[:id]
    unless @timesheet.present?
      response_not_found "Không tìm thấy phiên làm việc."
    end
  end
end
