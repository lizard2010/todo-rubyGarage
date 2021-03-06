Rails.application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match 'users/login', to: 'users#login', via: [:post]
  match 'users/projects', to: 'users#projects', via: [:get]
  match 'users/projects/:pid', to: 'users#project', via: [:get]
  match 'users/current', to: 'users#current', via: [:get]
  match 'users/tasks/:pid', to: 'users#tasks', via: [:get]
  match '/tasks/:pid', to: 'tasks#project', via: [:post]
  match '/tasks/:pid/:id', to: 'tasks#destroy', via: [:delete]
  match '/comments/:pid/:tid', to: 'comments#show', via: [:get], as: 'comments_fltrd'
  match '/comments/:pid/:tid', to: 'comments#update', via: [:put]
  match '/comments/:pid/:tid/:id', to: 'comments#destroy', via: [:delete]

  get 'static_pages/index'

  resources :projects
  resources :comments
  resources :tasks
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'

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
