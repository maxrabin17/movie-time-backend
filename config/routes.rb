Rails.application.routes.draw do
  resources :watch_laters
  resources :users

  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/movie-search/:search', to: 'apis#index'
end
