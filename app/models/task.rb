class Task < ApplicationRecord
  has_many :task_managers
  has_many :users, through: :task_managers

  belongs_to :project
end
