class CreateMassanges < ActiveRecord::Migration[5.0]
  def change
    create_table :massanges do |t|
      t.text :info
      t.integer :status
      t.references :from
      t.references :to

      t.timestamps
    end
  end
end
