Rails.application.routes.draw do
  get 'home/index'
  get 'users/index'

 resources :rooms do
    collection do
      get 'search'
    end
  
  end
  
  resources :resarvations do
    resources :rooms
  end
  
 devise_for :users
 
 root to: "home#index"
 
 resources :rooms
 resources :users
 resources :resarvations
 
 get 'rooms/show'
 get 'rooms/index'
 get 'rooms/new'
 post 'rooms/new' => 'rooms#create'
  
  
 get 'resarvations/new'
 post 'resarvations/new', to: 'resarvations#new'
 post 'reservations/new', to: 'reservations#create' 
 patch '/resarvations', to: 'resarvations#create'
 get 'resarvations/new', to: 'resarvations#update'
 post 'resarvations/:id', to:   'rearvation#create'
 get 'resarvations/index', to:  'resarvations#show'
 
 
 get 'users/profile' => 'users#profile'
 post 'users/profile' => 'users#update'
end
