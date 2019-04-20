class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :property_id
      t.string :value
      t.string :units
      t.integer :datatype
      t.integer :status
      t.timestamps
    end
  end
end
