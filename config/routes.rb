Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tassets#index'

  get '/tassets' => 'tassets#index'
  get '/tassets/critical' => 'tassets#critical', :as => :critical_tassets

  get '/tclasses' => 'tclasses#index'
  get '/tclasses/:id' => 'tclasses#show', :as => :tclasses_assets

end
