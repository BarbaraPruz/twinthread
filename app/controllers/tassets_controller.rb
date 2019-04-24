class TassetsController < ApplicationController
    def index
        @search_field = params[:search] ? params[:search] : "id"
        if params[:search]
            #puts "Searching for #{params["search"]} #{params["value"]}"
            if params["search"] == "status"
                params["value"] = AssetStatus.get_code(params["value"])
            end
            @assets = TAsset.where( params["search"] => params['value']).all
        else
            @assets = TAsset.all 
        end
    end

    def critical
        @assets = TAsset.where( status: '3' ).all
    end

    def parents
        # to get children: <tasset>.children
        # To Do: move to a different controller? Model?
        @parents = []
        ParentalRelation.select('DISTINCT t_asset_id').each do |p| 
          @parents << TAsset.find_by(:id => p.t_asset_id)
        end
    end
end
