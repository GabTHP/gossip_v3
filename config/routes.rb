Rails.application.routes.draw do
  get 'profil/view'
  get 'view/view'
  get 'controllername/view'
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
  resources :profil

  post "users/create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
