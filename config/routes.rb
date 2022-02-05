Rails.application.routes.draw do
  get 'home/index'
  get 'users/index'

 resources :rooms do
    collection do
      get 'search'
    end
  
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
 get 'resarvations/index'
 post 'resarvations/new', to: 'resarvations#new'
 post 'reservations/new', to:'reservations#create' 
 patch '/resarvations', to: 'resarvations#create'
 get 'resarvations/new', to: 'resarvations#update'
 
 
 get 'users/profile' => 'users#profile'
 post 'users/profile' => 'users#update'
end
