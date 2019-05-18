Rails.application.routes.draw do
  resources :places
    post 'places/changestatus', to: 'places#changestatus'
   post 'payments/paymentdetail', to: 'payments#paymentdetail'  
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
    resources :admins

  end


  namespace :admins do
     get 'payments/changestatus', to: 'payments#changestatus'
    resources :payments, except: [:update]
    resources :vouchers
    resources :messages 
    resources :products
    resources :categories
    resources :users
    resources :manages
    put 'payments/cancel_payment', to: 'payments#cancel_payment'
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
  get 'users/profile', to: 'users/registrations#show'
  get 'users/order', to: 'users/registrations#order'
  end
  get 'users/signup'
  get 'errors/loi'
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
