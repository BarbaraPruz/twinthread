class AssetStatus < ApplicationRecord

    def self.load_from_json(hash) 
        hash.keys.each do |k| 
            a = AssetStatus.create( :description => k, :code => hash[k] )
            puts "#{a.errors.full_messages}" if !a.valid?
        end
    end

    def self.get_description(code) 
        as = AssetStatus.find_by(:code => code)
        as ? as.description : "unknown"
    end

    def self.get_code(description)
        as = AssetStatus.find_by(:description => description)
        as ? as.code : 0
    end
end
