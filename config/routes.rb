Rails.application.routes.draw do
  resources :contact_infos
  resources :companies
  resources :categories
  resources :cities
  devise_for :users
  resources :addresses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "application#index"
end
