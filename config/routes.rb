Rails.application.routes.draw do
  namespace :admin do
    resources :admins
    resources :users
    resources :actors
    resources :awards
    resources :awards_awardees
    resources :directors
    resources :genres
    resources :movies
    resources :movies_actors
    resources :movies_genres
    resources :news
    resources :reviews
    resources :watchlist_items

    root to: "admins#index"
  end

  root to: 'home#index'

  devise_for :admins
  devise_for :users

  resources :home, only: [:index]

  resources :users, only: [:show]

  resources :news, only: [:show]

  resources :directors, only: [:index, :show]

  resources :actors, only: [:index, :show]

  resources :movies, only: [:index, :show] do
    member do
      post :add_to_watchlist
      post :remove_from_watchlist
      post :review
    end

    collection do
      get :featured
      get :recent
    end
  end

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
