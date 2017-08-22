class Role < ApplicationRecord
  has_many :users

  belongs_to :manager

  scope :of_manager, -> id {where manager_id: id}
end
