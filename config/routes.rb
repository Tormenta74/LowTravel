Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show]

  resources :travels

  put '/travels/:id/publish' => 'travels#publish', as: :publish
  put '/travels/:id/hide' => 'travels#hide', as: :hide

  get 'search/:keywords' => 'travels#index', as: :search
  get 'tags/:tag' => 'travels#index', as: :tag

  get '/home' => 'pages#home', as: '/'
  get '/about' => 'pages#about', as: 'about'

  root 'pages#home'
end
