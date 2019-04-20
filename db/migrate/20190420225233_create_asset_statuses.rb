class CreateAssetStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :asset_statuses do |t|
      t.string :description
      t.integer :code
      t.timestamps
    end
  end
end
