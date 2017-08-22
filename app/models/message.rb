class Message < ApplicationRecord
  belongs_to :fromable, polymorphic: true

  enum status: {noseen: 0, seen: 1}

  scope :desc, ->{order created_at: :desc}

  scope :htd, -> email {where to: email}

  def user
    User.find_by id: self.fromtable_id
  end

  def manager
    Manager.find_by id: self.fromtable_id
  end

  def user_mail
    User.find_by email: self.to
  end

  def manager_mail
    Manager.find_by email: self.to
  end
end
