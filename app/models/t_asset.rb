class TAsset < ApplicationRecord
    validates :assetId, presence: true, uniqueness: true   

    has_many :tClasses # classList

end
