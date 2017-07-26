class AddDeletedAtToTaskManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :task_managers, :deleted_at, :datetime
    add_index :task_managers, :deleted_at
  end
end
