class RolesController < ApplicationController
  before_action :load_role, only: [:update, :destroy]

  def index
    @roles = current_manager.roles
  end

  def create
    role = Role.new role_params
    if role.save
      flash[:success] = "Tạo thành công chức vụ #{role.name}"
    else
      flash[:danger] = "Không thể tạo chức vụ."
    end
    redirect_to roles_path
  end

  def update
    if @role.update_attributes role_edit_params
      flash[:success] = "Cập nhật thành công."
    else
      flash[:danger] = "Cập nhật thất bại."
    end
    redirect_to roles_path
  end

  def destroy
    if @role.users.size > 0
      flash[:danger] = "Không thể xóa chức vụ #{@role.name} vì nó có #{@role.users.size} nhân viên."
    else
      if @role.destroy
        flash[:success] = "Xóa thành công chức vụ #{@role.name}."
      else
        flash[:danger] = "Xóa không thành công"
      end
    end
    redirect_to roles_path
  end

  private
  def role_params
    params.require(:role).permit(:name, :info).merge manager_id: current_manager.id
  end

  def role_edit_params
    params.require(:role).permit :name, :info
  end

  def load_role
    @role = Role.find_by id: params[:id]
    unless @role.present?
      flash[:danger] = "Không tim thấy chức vụ."
    end
  end
end
