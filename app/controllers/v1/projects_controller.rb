class V1::ProjectsController < V1::BaseController
  def index
    resuft = current_user.projects.first
    if resuft.present?
      response_success t("api.success"), resuft
    else
      response_not_found  "Không có projetc nào"
    end
  end
end
