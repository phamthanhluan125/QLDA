class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.text :info
      t.string :icon

      t.timestamps
    end
  end
end
