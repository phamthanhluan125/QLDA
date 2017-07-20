class Role < ApplicationRecord
  has_many :project_managers
  has_many :users, through: :project_managers
end
