Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'users#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  post 'users/create'
  get 'users/:id' => 'users#show', as: :user_show
  get 'users/:id/edit' => 'users#edit', as: :user_edit
  post 'users/:id' => 'users#update'

  post 'sessions/create'
  delete 'sessions/:id' => 'sessions#destroy'

  get 'the_wall' => 'posts#index'
  post 'posts/create'
  delete 'posts/:id' => 'posts#destroy'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id' => 'posts#update'

  post 'comments/create'
  delete 'comments/:id' => 'comments#destroy'
  get 'comments/:id' => 'comments#show'
  get 'comments/:id/edit' => 'comments#edit'
  post 'comments/:id' => 'comments#update'

  post 'likes/create'
  delete 'likes/:id' => 'likes#destroy'

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
