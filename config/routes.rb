Rails.application.routes.draw do
  resources :movies
  resources :actors

  post '/movies/:id/actors/new', to: 'movies#add_actor', as: :add_actor
  delete 'movies/:id/actors/:actor_id', to: 'movies#remove_actor', as: :remove_actor

  post '/actors/:id/movies/new', to: 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id', to: 'actors#remove_movie', as: :remove_movie

  post '/actors/:actor_id/new', to: 'comments#create', as: :actor_comments
  post'/movies/:movie_id/new', to: 'comments#create', as: :movie_comments

  delete '/actors/:actor_id/delete', to: 'comments#delete', as: :actor_comment_delete
  delete '/movies/:movie_id/delete', to: 'comments#delete', as: :movie_comment_delete

  root 'site#index', as: :home


  get '/signup', to: 'access#signup', as: :signup
  post '/signup', to: 'access#create', as: :user_create 

  get '/login', to: 'access#login', as: :login
  post '/login', to: 'access#attempt_login'

  get '/home', to: 'site#index'

  delete '/logout', to: 'access#logout', as: :logout

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
