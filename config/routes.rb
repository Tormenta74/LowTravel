Rails.application.routes.draw do
  devise_for :users
  resources :travels do
    put 'publish' => 'travels#publish'
    put 'hide' => 'travels#hide'
  end

  get 'tags/:tag' => 'travels#index', as: :tag

  get '/home' => 'pages#home', as: '/'
  get '/about' => 'pages#about', as: 'about'

  root 'pages#home'
end
