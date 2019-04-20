puts "*** Clearing Database ***"
TAsset.delete_all
TClass.delete_all

puts "*** Loading Assets *** #{Rails.root}"
# Note: File.read reading complete file into memory so no good for extremely large datasets
data_hash = JSON.parse(File.read(File.join(Rails.root, 'app','json','tttestdata.txt')))
# To Do: maybe create tables for the asset status strings and data types
puts "asset_status #{data_hash['asset_status']}"
puts "data_types #{data_hash['dataType']}"

assets = data_hash['assets']

assets.each { | a | 
    asset = TAsset.create_from_json(a)       

    if !asset.valid? then
        puts "#{a}"
        puts "#{asset.errors.full_messages}"
    end
}

puts "*** Complete, assets loaded #{TAsset.all.count}, classes loaded #{TClass.all.count} ***"
