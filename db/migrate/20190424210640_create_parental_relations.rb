class CreateParentalRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :parental_relations do |t|
      t.integer :t_asset_id     # the parent
      t.integer :child_id
      t.timestamps
    end
  end
end
