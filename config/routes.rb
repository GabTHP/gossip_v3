Rails.application.routes.draw do
  get 'users/create'
  root 'home#index'
  resources :gossip do 
    resources :comments
  end
  resources :welcome
  resources :team
  resources :contact
  resources :author
  resources :cities
  resources :users
  resources :sessions

  post "users/create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
