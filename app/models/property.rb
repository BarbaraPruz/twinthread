class Property < ApplicationRecord
    validates :property_id, presence: true, uniqueness: true 

end
