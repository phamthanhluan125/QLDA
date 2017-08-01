class V1::AuthenUserTokensController < ApplicationController
  def index
    user = User.find_by_email params[:user_email]
    if user.present?
      if user.valid_password? params[:password]
        user.add_authentication_token
        serialization = ActiveModelSerializers::SerializableResource.new user
        response_success t("api.success"), serialization
      else
        response_error "Mật khẩu không đúng"
      end
    else
      response_not_found "Không tìm thấy tài khoản."
    end
  end
end
