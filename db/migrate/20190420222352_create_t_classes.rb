class CreateTClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :t_classes do |t|
      t.integer :class_id
      t.string :name
      t.string :drill
      t.timestamps
    end
  end
end
