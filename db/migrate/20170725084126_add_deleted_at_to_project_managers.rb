class AddDeletedAtToProjectManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :project_managers, :deleted_at, :datetime
    add_index :project_managers, :deleted_at
  end
end
