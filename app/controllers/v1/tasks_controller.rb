class V1::TasksController < V1::BaseController
  def index
    resuft = current_user.tasks
    if resuft.present?
      response_success t("api.success"), resuft
    else
      response_not_found  "Không có task nào"
    end
  end
end
