Rails.application.routes.draw do
  devise_for :users

  resources :favorites
  resources :contact_infos
  resources :companies
  resources :categories
  resources :cities
  resources :addresses
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cities#index"

  get "/about", to: "application#about", as: :about_page
  get "/manage/cities", to: "cities#manage_cities", as: :manage_cities
  get "/manage/categories", to: "categories#manage_categories", as: :manage_categories
  get "/manage/companies", to: "companies#manage_companies", as: :manage_companies
end
