Rails.application.routes.draw do

  root 'tags#index'

  get '/tags', to: 'tags#index', as: 'tags_index'
  get '/coordenadas', to: 'coordenadas#index', as: 'coordenadas_index'
  get '/bateria', to: 'battery#index', as: "battery_index"

  get 'hello/world', to: "hello#index" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

