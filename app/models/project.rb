class Project < ApplicationRecord
  has_many :project_managers, dependent: :destroy
  has_many :time_sheets, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :project_managers
  has_many :task_managers, through: :tasks

  belongs_to :admin

  enum status: {pending: 0, running: 1, delay: 2, finish: 3, cancel: 4}

  scope :of_admin, -> admin_id {where admin_id: admin_id}
  scope :for_update_status, -> {where status: [nil, 0, 1, 2]}
end
