Rails.application.routes.draw do
  #resources :categories
  #get 'admins/categories', to: 'categories#index'
  root 'pages#home'
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
   authenticate :admin do
  get '/admins/homepage', to:'admins#homepage'
  get '/admins/statistics', to:'manages#index'
  
  
  #get '/admins/statistics', to:'admins#homepage'
  scope '/admins' do
    #root'admins#homepage'
    resources :admins
    resource :manages 
  end

  resources :charges

  namespace :admins do
    resources :messages 
    resources :products
    resources :categories
    resources :users
    resources :manages
  end

end
  #user
  root 'pages#home'
   resource :carts
  get 'contact', to: 'pages#contact'
   get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  get 'users/signup'
  get 'errors/loi'


  #root :to 'admins#adminshome'
  #resources :admins, except: [:show]
  #resources :users, except: [:show]
  #resources :uploads, only: [:index, :show, :update, :create]
  #resources :settings, only: [:index, :edit, :update]
 
  resources :messages 

  resources :categories, only: [:show]
  resources :users, except: [:destroy, :index]
  resources :products, only: [:show]

  delete 'images', to:  'products#destroyimage'
  get '/cart', to: 'carts#show', as: 'cart'
  post 'add', to: 'cartproducts#create'
  get 'destroycart', to: 'carts#destroy'



  resources :payments, only: [:new, :create]
  resources :carts
  resources :cart_products


  post 'create', to: 'messages#create'
  mount ActionCable.server => '/cable'

end
