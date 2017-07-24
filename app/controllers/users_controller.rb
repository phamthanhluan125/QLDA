class UsersController < ApplicationController
  before_action :load_user, only: :update
  before_action :check_email, only: :create

  def index
    @users = User.of_admin current_admin.id
    @roles = Role.of_admin current_admin.id
  end

# update user profile
  def update
    if @user.update_attributes user_params
      flash[:success] = "Cập nhật thông tin nhân viên thành công!"
    else
      flash[:danger] = "Cập nhật thông tin nhân viên thất bại!"
    end
    redirect_to users_path
  end

  def new
    @roles = Role.of_admin current_admin.id
  end

  def create
    user = User.new new_user_params
    binding.pry
    if user.save
      flash[:success] = "Tạo thành công nhân viên " + params[:user][:name]
    else
      flash[:danger] = "Tạo nhân viên thất bại!"
    end
    redirect_to new_user_path
  end

  private
  def new_user_params
    params.require(:user).permit(:name, :email, :password, :avatar, :gender,
      :status, :address, :birthday, :time_scr, :role_id).merge admin_id: current_admin.id
  end

  def user_params
    params.require(:user).permit :name, :address, :birthday, :gender, :avatar,
      :status, :time_scr, :role_id
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user.present?
      flash[:danger] = "Không tìm thấy nhân viên này!"
      redirect_to users_path
    end
  end

  def check_email
    user = User.find_by email: params[:user][:email]
    admin = Admin.find_by email: params[:user][:email]
    if user.present? || admin.present?
      flash[:danger] = "Email này đã tồn tại, vui lòng chọn email khác"
      redirect_to new_user_path
    end
  end
end
