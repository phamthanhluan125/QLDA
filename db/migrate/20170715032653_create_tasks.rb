class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :info
      t.date :start_date
      t.date :deadline
      t.date :finish_date
      t.integer :status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
