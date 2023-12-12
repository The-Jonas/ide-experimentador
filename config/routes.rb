Rails.application.routes.draw do

  root 'filtros#index'
  get '/filtros', to: 'filtros#index', as: 'filtros_index'

  get 'hello/world', to: "hello#index"

  get "up" => "rails/health#show", as: :rails_health_check


end
