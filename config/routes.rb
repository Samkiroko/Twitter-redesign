Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: %i[show edit update destroy] do
    member do
      post 'followings', to: 'followings#create'
    end
  end

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/discover', to: 'opinions#discover', as: 'discover'
  resources :opinions, only: %i[new create index]

  resources :followings, only: %i[destroy]
end
