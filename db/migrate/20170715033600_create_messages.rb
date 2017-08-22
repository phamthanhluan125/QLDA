class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :info
      t.integer :status, default: 0
      t.references :fromtable, polymorphic: true, index: true
      t.string :to
      t.timestamps
    end
  end
end
