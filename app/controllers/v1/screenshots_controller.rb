class V1::ScreenshotsController < V1::BaseController
  skip_before_filter :verify_authenticity_token, only: :create

  def index
    response_success "OK", Screenshot.all
  end

  def create
    scr = Screenshot.create scr_params
    if scr.save
      response_success "Thành công.", scr
    else
      response_error "Thất bại."
    end
  end

  private
  def scr_params
    params.require(:screenshot).permit :image, :timesheet_id
  end
end
