Rails.application.routes.draw do
  #resources :categories
  #get 'admins/categories', to: 'categories#index'
  root 'pages#home'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
   authenticate :admin do
  #   scope '/admins' do
  #     #rails_admin admin panel
  #     mount RailsAdmin::Engine => '/', as: 'rails_admin'
  #     #get '/product/:id/edit',to: ' rails_admin/main#edit'
  #     # resources :products
  #     get '/products/:id/edit', to: 'products#edit'
  #   end
  # end
  #mount RailsAdmin::Engine => '/admins/database/', as: 'rails_admin'
  #namespace :category do
  #  resources :products,only: [:show]
  #end
  #get 'password_resets/:id/edit', to: 'password_reset#create', as: :send_password_reset
  #get 'categories/:category_id/:id' =>'products#show'
  get '/admins/homepage', to:'admins#homepage'
  #get '/admins/statistics', to:'admins#homepage'
  scope '/admins' do
    #root'admins#homepage'
    resources :admins
    resources :products
    resources :categories,only: [:edit,:update,:destroy,:new]
    resources :manages
    resources :users
    #resource :charts, 
    #resources :statistics
    #resources :layouts
    #delete 'admins/sign_out',to: 'sessions#destroy'
  end
end
scope '/' do
  resources :categories,only: [:show]
  resources :products,only: [:show]
end
 
  #user
   resource :carts
  get 'contact', to: 'pages#contact'
   get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  get 'users/signup'
  get 'errors/loi'
  #resources :categories, except: [:show]

  #root :to 'admins#adminshome'
  #resources :admins, except: [:show]
  #resources :users, except: [:show]
  #resources :uploads, only: [:index, :show, :update, :create]
  #resources :settings, only: [:index, :edit, :update]
 

  #resources :categories
  resources :users, except: [:destroy, :index]
  #resources :products

  delete 'images', to:  'products#destroyimage'
  get '/cart', to: 'carts#show', as: 'cart'
  post 'add', to: 'cartproducts#create'
  get 'destroycart', to: 'carts#destroy'
end
