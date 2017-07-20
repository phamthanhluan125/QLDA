class Project < ApplicationRecord
  has_many :project_managers
  has_many :time_sheets
  has_many :tasks
  has_many :users, through: :project_managers
  has_many :task_managers, through: :tasks

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
end
