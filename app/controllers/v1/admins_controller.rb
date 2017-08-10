class V1::AdminsController < V1::BaseController
  def index
    resuft = current_user.admin
    if resuft.present?
      response_success t("api.success"), resuft
    else
      response_not_found  "Không tìm thấy Managers nào"
    end
  end
end
