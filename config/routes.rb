Rails.application.routes.draw do
  resources :favorites
  devise_for :users

  resources :contact_infos
  resources :companies
  resources :categories
  resources :cities
  resources :addresses
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cities#index"
end
