class CreateTaskManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :task_managers do |t|
      t.text :note
      t.date :start_date
      t.date :deadline
      t.date :finish_date
      t.integer :status
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
