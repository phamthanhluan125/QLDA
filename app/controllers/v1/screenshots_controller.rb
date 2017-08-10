class V1::ScreenshotsController < V1::BaseController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    if Screenshot.create scr_params
      response_success "Thành công."
    else
      response_error "Thất bại."
    end
  end

  private
  def scr_params
    params.require(:screenshot).permit :image, :timesheet_id
  end
end
