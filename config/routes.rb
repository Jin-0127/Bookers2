Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/home/about" ,to:'homes#about',as:'about'
  resources :books
  resources :users 
end
