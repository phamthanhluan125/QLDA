class Task < ApplicationRecord
  acts_as_paranoid

  has_many :task_managers
  has_many :users, through: :task_managers

  belongs_to :project

  enum status: {pending: 0, running: 1, delay: 2, finish: 3, cancel: 4}

  scope :for_update_status, -> {where status: [nil, 0, 1, 2]}
  scope :of_project, -> project_id {where project_id: project_id}
end
