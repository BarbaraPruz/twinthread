class TassetsController < ApplicationController
    def index
        @assets = TAsset.all
    end
end
