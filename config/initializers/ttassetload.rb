url = 'https://www.twinthread.com/code-challenge/assets.txt'
 
puts "*** Clearing Database ***"
TAsset.delete_all
TClass.delete_all

# puts "*** Loading Assets *** #{Rails.root}"
# Note: File.read reading complete file into memory so no good for extremely large datasets
# data_hash = JSON.parse(File.read(File.join(Rails.root, 'app','json','tttestdata.txt')))

puts "*** Loading Assets *** #{url}"
res = Faraday.get url
# To Do: not handling errors.  
data_hash = JSON.parse(res.body)

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

puts "*** Complete, assets loaded #{TAsset.all.count}, classes loaded #{TClass.all.count} ***"

