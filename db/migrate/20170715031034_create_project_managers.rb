class CreateProjectManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_managers do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
