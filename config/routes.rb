Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  mount Ckeditor::Engine => '/ckeditor'
  get 'brands/show'
  post 'notifications/create'
  get 'notifications/:id' , to: 'notifications#show'
  post 'payments/paymentdetail', to: 'payments#paymentdetail'
  #resources :categories
  #get 'admins/categories', to: 'categories#index'
  root 'pages#home'
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations',passwords: 'admins/passwords',confirmations: 'admins/confirmations' }
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations',omniauth_callbacks: "users/omniauth_callbacks"}
  authenticate :admin do
    get '/admins/homepage', to:'admins#homepage'
    # get '/admins/statistics', to:'manages#index'


    #get '/admins/statistics', to:'admins#homepage'
    scope '/admins' do
      resources :admins
    end
    namespace :admins do
      put 'payments/changestatus', to: 'payments#changestatus'
      resources :payments, except: [:update]
      resources :vouchers
      resources :messages
      resources :products ,except: [:destroy]
      match 'products/set_status/:id/status=:status' => 'products#destroy', :via => [:post] ,as: :product_status
      resources :categories,except: [:destroy,:show]
      match 'categories/set_status/:id/status=:status' => 'categories#destroy', :via => [:post] ,as: :category_status
      resources :brands,except: [:destroy]
      match 'brands/set_status/:id/status=:status' => 'brands#destroy', :via => [:post] ,as: :brand_status
      resources :users,except: [:destroy,:show]
      match 'users/set_status/:id/status=:status' => 'users#destroy', :via => [:post] ,as: :user_status
      resources :news,except: [:destroy]
      match 'news/set_status/:id/status=:status' => 'news#destroy', :via => [:post] ,as: :news_status
      resources :type_of_news,except: [:destroy]
      match 'type_of_news/set_status/:id/status=:status' => 'type_of_news#destroy', :via => [:post] ,as: :type_of_news_status
      resources :manages, only: [:index]
      resources :comments
      resources :carousels,except: [:show]
      resources :districts, only: [:index]
      resources :provinces, only: [:create, :index]

      post 'comments/newcomment', to: 'comments#newcomment'
      post 'comments/returncomment', to: 'comments#returncomment'
      post 'messages/received', to: 'messages#received'
      put 'payments/cancel_payment', to: 'payments#cancel_payment'
      post 'messages/watchedmore', to: 'messages#watchedmore'
      delete 'images', to:  'products#destroyimage'
      post 'news/search_products_for_news', to: 'news#search_products_for_news'
      match 'manages/process_data' => 'manages#process_data', :via => [:get] ,as: :process_data
      post 'manages/get_file_database', to: 'manages#get_file_database'
      post 'manages/download/:key', to: 'manages#download',as: :dowload_file_database
      post 'manages/delete/model=:model', to: 'manages#delete',as: :delete_status_closed
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
    get 'users/sign_out' => 'devise/sessions#destroy'
    post 'users/change_avatar', to: 'users/registrations#change_avatar'
  end
  get 'users/signup'
  get 'errors/loi'
  resources :contacts,only: [:new,:create]
  resources :messages
  get 'show', to: 'messages#show'
  post 'messages/received', to: 'messages#received'
  # resources :categories, only: [:show]
  resources :users, except: [:destroy, :index] do
    collection do
      patch 'update_password'
    end
  end
  # resources :products, only: [ :index]
  post 'products/watched_more_related_products', to: 'products#watched_more_related_products'
  get '/search', to: 'products#search', as: 'search'
  get '/products', to: 'products#index'
  delete 'images', to:  'products#destroyimage'
  get '/cart', to: 'carts#show', as: 'cart'
  post 'add', to: 'cart_products#create'
  post 'carts/destroycart', to: 'carts#destroycart'
  post 'carts/changeqt', to: 'carts#changeqt'
  resources :payments, only: [:new, :create]
  resources :carts
  resources :cart_products
  resources :comments
  post 'comments/watchedmore', to: 'comments#watchedmore'
  post 'messages/watchedmore', to: 'messages#watchedmore'

  get '/categories/:cus/:name/:brand_name', to: 'categories#show', as: 'category'
  get 'products/:name', to: 'products#show' ,as: 'product'
  get 'news', to: 'news#index' ,as: 'news_index'
  get 'news/type=:type&&title=:title', to: 'news#show', as: 'news'
  get 'news/type=:type', to: 'news#news_category', as: 'news_category'
  get 'payments/find_district', to: 'payments#find_district'
  get 'payments/find_ward', to: 'payments#find_ward'
  get 'payments/calc_shipping_fee', to: 'payments#calc_shipping_fee'
  get 'payments/cancel_payment', to: 'payments#cancel_payment'
  post 'payments/api_webhook', to: 'payments#api_webhook' 
  get 'vouchers/validate', to:'vouchers#validate'
  post 'create', to: 'messages#create'
  mount ActionCable.server => '/cable'
end
