class MyDevise::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    binding.pry
    user = User.find_by email: params["user"]["email"]
    if user.present?
      if user.is_manager?
        super
      else
        flash[:alert] = "Tài khoản hoặc mật khẩu không đúng"
        redirect_to :back
      end
    else
      flash[:alert] = "Tài khoản hoặc mật khẩu không đúng"
      redirect_to :back
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
