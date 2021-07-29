Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tweets#index'

  get '/list', to: 'tweets#index', as: 'index'

end
