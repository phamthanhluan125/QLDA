class Timesheet < ApplicationRecord
  has_many :screenshots

  belongs_to :project
  belongs_to :user
end
