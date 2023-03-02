Rails.application.routes.draw do
  root to: "homes#top"
  
  get "home/about" => "homes#about"
  
  devise_for :users
  
  resources :users, only: [:show, :edit, :index, :update]
  
  resources :books, only: [:show, :edit, :index, :update, :create, :destroy]
  
end
