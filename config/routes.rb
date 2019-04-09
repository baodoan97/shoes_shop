Rails.application.routes.draw do
  resources :places
    post 'places/changestatus', to: 'places#changestatus'

  #resources :categories
  #get 'admins/categories', to: 'categories#index'
  root 'pages#home'
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations',passwords: 'admins/passwords',confirmations: 'admins/confirmations' }
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
   authenticate :admin do
  get '/admins/homepage', to:'admins#homepage'
 # get '/admins/statistics', to:'manages#index'
  
  
  #get '/admins/statistics', to:'admins#homepage'
  scope '/admins' do
    #root'admins#homepage'
    resources :admins

    # resources :products

    #resource :manages 
    #resources :statistics
    #resources :layouts
    #delete 'admins/sign_out',to: 'sessions#destroy'

  end

  resources :charges

  namespace :admins do
     get 'payments/changestatus', to: 'payments#changestatus'
    resources :payments
    resources :vouchers
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
  get 'contacts', to: 'contacts#new'
  get 'about', to: 'pages#about'
  #  get 'login', to: 'sessions#new'
  # get 'signup', to: 'users#new'
  devise_scope :user do
  get 'users/show', to: 'users/registrations#show'
  end
  get 'users/signup'
  get 'errors/loi'
  

  #root :to 'admins#adminshome'
  #resources :admins, except: [:show]
  #resources :users, except: [:show]
  #resources :uploads, only: [:index, :show, :update, :create]
  #resources :settings, only: [:index, :edit, :update]
  resources :contacts,only: [:new,:create]
  resources :messages 
  get 'show', to: 'messages#show'
  resources :categories, only: [:show]
  resources :users, except: [:destroy, :index]
  resources :products, only: [:show]

  delete 'images', to:  'products#destroyimage'
  get '/cart', to: 'carts#show', as: 'cart'
  post 'add', to: 'cart_products#create'
  get 'destroycart', to: 'carts#destroy'



  resources :payments, only: [:new, :create]
  resources :carts
  resources :cart_products


  post 'create', to: 'messages#create'
  mount ActionCable.server => '/cable'

end
