class CreateUserManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_managers do |t|
      t.integer :time_scr
      t.references :manager
      t.references :staff

      t.timestamps
    end
  end
end
