Rails.application.routes.draw do
  get 'home/index'
 get 'users/index'
  
 devise_for :users
  
 root to: "home#index"
 
 
 
end
