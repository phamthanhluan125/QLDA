class Timesheet < ApplicationRecord
  has_many :screenshots, dependent: :destroy

  belongs_to :project
  belongs_to :user

  scope :by_project_id, -> id {where project_id: id}
  scope :by_user_id, -> id {where user_id: id}
end
