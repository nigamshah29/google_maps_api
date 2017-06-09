Rails.application.routes.draw do
  root 'maps#index'

  post '/search' => 'maps#search'

  post '/create_property' => 'maps#create_property'

  get '/properties_json' => 'maps#properties_json'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
