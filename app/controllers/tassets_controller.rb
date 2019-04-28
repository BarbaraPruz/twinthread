class TassetsController < ApplicationController
    def index
        # ToDo: search getting complicated.  Maybe move to model...
        # especially if dealing with user syntax (?) to SQL syntax (%)
        @search_field = params[:search] ? params[:search] : "id"
        if params[:search]
            puts "Searching for #{params["search"]} #{params["value"]}"
            if params["search"] == "status"
                params["value"] = AssetStatus.get_code(params["value"])
            end
            @assets = TAsset.where(query_string(params["search"]), params["value"])
        else
            @assets = TAsset.all 
        end
    end

    def critical
        @assets = TAsset.where( status: '3' ).all
    end

    private
    # why doing this weird thing?  Because the ? won't work for
    # the column name (SQL treating the column and value name strings differently)
    # A more secure approach would be to assign query string in case statement
    # (so we are sure search_field is valid)
    def query_string search_field
        "#{search_field} LIKE ?"
    end
end
