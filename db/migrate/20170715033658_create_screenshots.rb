class CreateScreenshots < ActiveRecord::Migration[5.0]
  def change
    create_table :screenshots do |t|
      t.string :image
      t.integer :status
      t.references :timesheet, foreign_key: true

      t.timestamps
    end
  end
end
