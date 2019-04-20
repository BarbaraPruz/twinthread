module ApplicationHelper

    # asset index search helpers
    def search_select_tag (search_field)
        fields= [{value: '', display: 'Choose Search Field'}, 
                 {value: 'asset_id', display: 'Id'},
                 {value: 'name', display: 'Name'}, 
                 {value: 'description', display: 'Description'},
                 {value: 'status', display: 'Status'}, 
                 {value: 'icon', display: 'Icon'},                                           
                 {value: 'parent_asset_id', display: 'Parent Id'}]
    
        html = "<select name='search' id='search'>"
        fields.each do |field|
            html += "<option #{search_selected_option(field[:value], search_field)} "
            html += " value=#{field[:value]}>#{field[:display]}</option>"
        end
        html.html_safe
    end
    
    def search_selected_option(field, search_field)
        field==search_field ? "selected='selected'" : ""
    end

    # status lookup
    def lookup_status (c)
        AssetStatus.get_description(c)
    end
end
