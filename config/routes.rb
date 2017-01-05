Rails.application.routes.draw do
  get '/home' => 'pages#home', as: 'home'
  get '/about' => 'pages#about', as: 'about'

  root 'pages#home'
end
