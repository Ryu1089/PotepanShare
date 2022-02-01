Rails.application.routes.draw do
 
 resources :rooms do
    collection do
      get 'search'
    end
  　resources :resarvations
  end
  
 devise_for :users
 
 root to: "home#index"
 resources :rooms
 resources :users
end
