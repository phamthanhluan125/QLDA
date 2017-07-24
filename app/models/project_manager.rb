class ProjectManager < ApplicationRecord
  belongs_to :user
  belongs_to :project

  scope :of_project, -> project_id {where project_id: project_id}
end
