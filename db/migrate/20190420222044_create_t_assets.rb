class CreateTAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :t_assets do |t|
      t.integer :asset_id
      t.string  :name
      t.string  :description
      t.integer :status
      t.string  :icon
      # To Do: following should be id's to property table
      # t.integer :running  
      # t.integer :utilization
      # t.integer :performance 
      # t.integer :location
      # classList is has many TClasses
      # Parent / Child relation : to do: add has_many/belongs to
      t.integer :parent_asset_id 
    end
  end
end
