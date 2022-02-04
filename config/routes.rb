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
 post 'resarvations/new'
 post 'resarvations/create'
 
get 'users/profile' => 'users#profile'
post 'users/profile' => 'users#update'
end
