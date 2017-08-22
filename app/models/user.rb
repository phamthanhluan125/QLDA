class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :project_managers
  has_many :projects, through: :project_managers
  has_many :messages, dependent: :destroy
  has_many :timesheets
  has_many :task_managers
  has_many :tasks, through: :task_managers
  has_many :messages , as: :fromtable

  belongs_to :manager
  belongs_to :role

  enum status: {active: 0, locked: 1}

  mount_uploader :avatar, AvatarUploader

  scope :of_manager, -> id {where manager_id: id}
  scope :not_ids, -> ids {where.not id: ids}

  def add_authentication_token
    self.update_attributes authentication_token: generate_authentication_token
  end

  private
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token if User.where(authentication_token: token).count.zero?
    end
  end
end
