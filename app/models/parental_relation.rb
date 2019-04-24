class ParentalRelation < ApplicationRecord
    belongs_to :t_asset, :class_name => "TAsset"
    belongs_to :child, :class_name => "TAsset"
end
