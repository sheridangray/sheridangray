Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  # Devise
  
  devise_for :users
  devise_scope :user do get "/login", to: "devise/sessions#new" end
  devise_scope :user do get "/logout", to: "devise/sessions#destroy" end

  # Static Pages
  get '/bio', to: 'static_pages#bio'
  get '/resume', to: 'static_pages#resume'
  get '/contact', to: 'static_pages#contact'

  # Resources 
  resources :projects
  resources :wardrobes
  resources :clothing_items, except: [:show, :index]
  resources :styles, only: [:show]

end
