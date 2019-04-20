class TclassesController < ApplicationController
    def index
        @class_count = TClass.all.count;
        @class_name_count = TClass.distinct.count(:name) 
        # ASSUMPTION : all classes have unique names!
        @classes = TClass.all
    end

    def show
        puts "Class show #{params}"
        @class = TClass.find_by(:id => params[:id])
    end
end
