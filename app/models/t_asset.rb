class TAsset < ApplicationRecord
    validates :asset_id, presence: true, uniqueness: true   

    has_and_belongs_to_many :t_classes

    def self.create_from_json asset_hash
        asset = TAsset.create( 
            :asset_id => asset_hash['assetId'], 
            :name => asset_hash['name'],
            :description => asset_hash['description'],
            :status => asset_hash['status'],
            :icon => asset_hash['icon'],
            :parent_asset_id => asset_hash['parentId']
        )
        asset_hash['classList'].each { |c|
            asset_class = TClass.find_or_create_by(class_id: c['id']) do |tc|
                tc.name = c['name']
                tc.drill = c['drill']
            end
            asset.t_classes << asset_class
        }
        asset.save
        asset
    end
    
end
