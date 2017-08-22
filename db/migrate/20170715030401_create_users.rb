class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.boolean :gender, default: false
      t.string :address
      t.string :avatar
      t.integer :time_scr
      t.integer :status, default: 0
      t.references :role, foreign_key: true
      t.references :manager, foreign_key: true
      t.timestamps
    end
  end
end
