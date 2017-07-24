class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :info
      t.date :start_date
      t.date :deadline
      t.date :finish_date
      t.integer :status
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
