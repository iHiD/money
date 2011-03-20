Money::Application.routes.draw do
  
  resources :users
  
  resources :sessions
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  get "overview" => "overview#index", :as => "overview"

  root :to => "overview#index"
  
end
