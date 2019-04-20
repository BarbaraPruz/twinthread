class TClass < ApplicationRecord
    validates :class_id, presence: true, uniqueness: true 

    has_and_belongs_to_many :t_assets
end
