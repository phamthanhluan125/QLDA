class TaskManager < ApplicationRecord
  acts_as_paranoid

  belongs_to :task
  belongs_to :user

  enum status: {pending: 0, running: 1, delay: 2, finish: 3, cancel: 4}

  scope :for_update_status, -> {where status: [nil, 0, 1, 2]}
  scope :by_ids, -> ids {where task_id: ids}
  scope :of_user, -> user_id {where user_id: user_id}
end
