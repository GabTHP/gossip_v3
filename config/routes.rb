Rails.application.routes.draw do
  root 'home#index'
  resources :gossip
  resources :welcome
  resources :team
  resources :contact
  resources :author
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
