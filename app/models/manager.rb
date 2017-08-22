class Manager < ApplicationRecord

  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :users
  has_many :roles
  has_many :projects
  has_many :messages , as: :fromtable

  scope :of_manager, -> manager_id {where manager_id: manager_id}
end
