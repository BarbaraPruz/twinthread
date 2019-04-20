class CreateJoinTableTAssetsTClasses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :t_assets, :t_classes do |t|
      t.index [:t_asset_id, :t_class_id]
      t.index [:t_class_id, :t_asset_id]
    end
  end
end
