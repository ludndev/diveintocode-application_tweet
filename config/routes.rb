Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tweets#index', as: 'tweets_index'

  get '/tweet/new', to: 'tweets#new', as: 'new_tweet'

  get '/tweet/:id', to: 'tweets#show', as: 'show_tweet'

  get '/tweet/:id/update', to: 'tweets#update', as: 'update_tweet'

  get '/tweet/:id/delete', to: 'tweets#delete', as: 'delete_tweet'

  # post

  post '/post/tweet/:id/new', to: 'tweets#post_new', as: 'post_new_tweet'

  post '/post/tweet/:id/update', to: 'tweets#post_update', as: 'post_update_tweet'

  post '/post/tweet/:id/delete', to: 'tweets#post_delete', as: 'post_delete_tweet'

end
