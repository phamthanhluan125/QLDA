class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.boolean :gender
      t.string :address
      t.string :avatar
      t.integer :status
      t.boolean :is_manager, default: false

      t.timestamps
    end
  end
end
