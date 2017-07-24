class Role < ApplicationRecord
  has_many :users

  belongs_to :admin

  scope :of_admin, -> admin_id {where admin_id: admin_id}
end
