class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :own_projects, class_name: "Project", foreign_key: :owner_id
  has_many :project_managers
  has_many :staffs, class_name: "UserManager", foreign_key: :staff_id
  has_many :managers, class_name: "UserManager", foreign_key: :manager_id
  has_many :messanges
  has_many :time_sheets
  has_many :task_managers
  has_many :tasks, through: :task_managers
  has_many :to_messanges, class_name: "Messange", foreign_key: :to_id
  has_many :from_messanges, class_name: "Messange", foreign_key: :from_id

  belongs_to :admin
  belongs_to :role

  enum status: {active: 0, locked: 1}

  mount_uploader :avatar, AvatarUploader

  scope :of_admin, -> admin_id {where admin_id: admin_id}
  scope :not_ids, -> ids {where.not id: ids}

  def add_authentication_token
    self.update_attributes authentication_token: generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token if User.where(authentication_token: token).count.zero?
    end
  end
end
