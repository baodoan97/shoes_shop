Rails.application.routes.draw do
  #resources :categories
  #get 'admins/categories', to: 'categories#index'
  mount RailsAdmin::Engine => '/admins/database/', as: 'rails_admin'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users
  #user
  root 'pages#home'
  get 'contact', to: 'pages#contact'
   get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  get 'users/signup'
  #resources :categories, except: [:show]
namespace :admins do
  root 'admins#index'
  resources :posts, except: [:show]
  #resources :users, except: [:show]
  resources :uploads, only: [:index, :show, :update, :create]
  resources :settings, only: [:index, :edit, :update]
 
end
  resources :categories
  resources :users, except: [:destroy, :index]
  resources :products

  delete 'images', to:  'products#destroyimage'

  
end
