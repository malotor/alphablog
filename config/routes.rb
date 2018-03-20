Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#home'
  get 'about', to: 'welcome#about'

  # Create all endpoints to CRUD articles
  resources :articles

  # Signup
  get 'signup', to: 'users#new'
  resources :users , except: [:new]

  # Login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'


  resources :categories, except: [:destroy]
  #Invitations
  resources :invitations, except: [:edit,:show,:update]
end
