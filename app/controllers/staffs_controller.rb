class StaffsController < ApplicationController
  before_action :load_user, only: [:update, :destroy]
  before_action :check_email, only: :create

  def index
    @users = User.of_manager current_manager.id
    @roles = Role.of_manager current_manager.id
  end

# update user profile
  def update
    if @user.update_attributes user_params
      flash[:success] = "Cập nhật thông tin nhân viên thành công!"
    else
      flash[:danger] = "Cập nhật thông tin nhân viên thất bại!"
    end
    redirect_to staffs_path
  end

  def new
    @roles = Role.of_manager current_manager.id
  end

  def create
    user = User.new new_user_params
    user.authentication_token = Devise.friendly_token
    if user.save
      flash[:success] = "Tạo thành công nhân viên " + params[:user][:name]
    else
      flash[:danger] = "Tạo nhân viên thất bại!"
    end
    redirect_to new_staff_path
  end

  def destroy
    if @user.projects.present? || @user.tasks.present? || @user.timesheets.present?
      flash[:danger] = "Chỉ có thể xóa nhân viên khi nhân viên chưa tham gia dự án, chưa phân công task và chưa có timesheets nào."
    else
      @user.destroy
      flash[:success] = "Đã xóa thành công nhân viên #{@user.name}"
    end
    redirect_to staffs_path
  end

  private
  def new_user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :gender,
      :status, :address, :birthday, :time_scr, :role_id).merge manager_id: current_manager.id,
      password_confirmation: params[:user][:password]
  end

  def user_params
    params.require(:user).permit :name, :address, :birthday, :gender, :avatar,
      :status, :time_scr, :role_id
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user.present?
      flash[:danger] = "Không tìm thấy nhân viên này!"
      redirect_to staffs_path
    end
  end

  def check_email
    user = User.find_by email: params[:user][:email]
    manager = Manager.find_by email: params[:user][:email]
    if user.present? || manager.present?
      flash[:danger] = "Email này đã tồn tại, vui lòng chọn email khác"
      redirect_to new_staff_path
    end
  end
end
