class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.date :birthday
      t.boolean :gender, default: false
      t.string :address
      t.string :avatar
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
