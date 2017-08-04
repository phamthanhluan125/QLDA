class V1::UsersController < V1::BaseController
  skip_before_filter :verify_authenticity_token, only: :update
  def update
    if current_user.update_attributes user_params
      response_success "Cập nhật thông tin cá nhân thành công", current_user
    else
      response_error "Thất bại"
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :avatar, :birthday, :gender, :address
  end
end
