class UserManager < ApplicationRecord
  belongs_to :manager, class_name: "User", foreign_key: :manager_id
  belongs_to :staff, class_name: "User", foreign_key: :staff_id
end
