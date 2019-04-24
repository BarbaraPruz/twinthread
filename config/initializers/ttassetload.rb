# Verify rake db:create has been executed
return if ActiveRecord::Base.connection.data_sources.length==0

url = 'https://www.twinthread.com/code-challenge/assets.txt'
 
puts "*** Clearing Database ***"
TAsset.delete_all
TClass.delete_all
AssetStatus.delete_all
ParentalRelation.delete_all

puts "*** Loading Assets *** #{Rails.root}"
# Note: File.read reading complete file into memory so no good for extremely large datasets
data_hash = JSON.parse(File.read(File.join(Rails.root, 'app','json','tttestdata.txt')))

# puts "*** Loading Assets *** #{url}"
# res = Faraday.get url
# # To Do: not handling errors.  
# data_hash = JSON.parse(res.body)

AssetStatus.load_from_json(data_hash['asset_status'])
puts "Loaded status values #{AssetStatus.all.count}"

puts "data_types #{data_hash['dataType']}"

assets = data_hash['assets']

assets.each { | a | 
    asset = TAsset.create_from_json(a)       

    if !asset.valid? then
        puts "#{a}"
        puts "#{asset.errors.full_messages}"
    end
}

puts "*** Assets loaded, creating parent relationships ***"
TAsset.where.not(parent_asset_id: nil).all.each { |c|
    parent = TAsset.find_by(asset_id: c.parent_asset_id)
    if !parent
        puts "Child #{c.asset_id} Parent #{c.parent_asset_id} - Not Found!"
    else
        puts "Child #{c.asset_id} Parent #{c.parent_asset_id} ParentId #{parent.id}"
        parent.parental_relations.build(:child_id => c.id)
        parent.save
    end
}

puts "*** Complete, assets loaded #{TAsset.all.count}, classes loaded #{TClass.all.count}, parent relations #{ParentalRelation.all.count}***"
