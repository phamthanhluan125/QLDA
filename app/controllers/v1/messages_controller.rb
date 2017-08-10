class V1::MessagesController < V1::BaseController
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
    params.require(:message).permit(:info, :id_to).merge id_to: current_user.id
  end
end
