Rails.application.routes.draw do
  devise_for :users

  get '/home' => 'pages#home', as: 'home'
  get '/about' => 'pages#about', as: 'about'

  root 'pages#home'
end
