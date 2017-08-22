class V1::ManagersController < V1::BaseController
  def index
    resuft = current_user.manager
    if resuft.present?
      response_success t("api.success"), resuft
    else
      response_not_found  "Không tìm thấy Managers nào"
    end
  end
end
