class Timesheet < ApplicationRecord
  has_many :screenshots, dependent: :destroy

  belongs_to :project
  belongs_to :user
end
