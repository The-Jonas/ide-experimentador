Rails.application.routes.draw do

  root 'tags#index'

  get '/tags', to: 'tags#index', as: 'tags_index'
  get '/coordenadas', to: 'coordenadas#index', as: 'coordenadas_index'
  get '/bateria', to: 'battery#index', as: 'battery_index'
  get '/status', to: 'status#index'
  get '/ativos', to: 'ativos#index'
  get '/filtros', to: 'filtros#index', as: 'filtros_index'

  get 'hello/world', to: "hello#index"

  get "up" => "rails/health#show", as: :rails_health_check


end
