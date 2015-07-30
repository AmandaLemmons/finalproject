Rails.application.routes.draw do

  root 'yelps#dashboard'

  get '/index' => 'yelps#index', as: :index
  get '/signup' => 'users#new', as: :signup
  post '/users' => 'users#create', as: :users


  get '/login' => 'session#new', as: :login
  post '/auth' => 'session#create', as: :auth
  get '/logout' => 'session#destroy', as: :logout

  get 'savedlocations/' => 'savedlocations#show', as: :saved_locations
  post 'savedlocation' => 'savedlocations#create', as: :saved_location
  delete 'savedlocations/:business_id' => 'savedlocations#destroy', as: :delete_location

  get '/trip/new' => 'trips#new', as: :new_trip
  get 'trip/show' => 'trips#show', as: :show_trip
  post '/trips' => 'trips#create', as: :trips
  get 'add_location' => 'trips#add_location', as: :add_location
  delete '/trips/:id'=> 'trips#destroy', as: :delete_trip




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
