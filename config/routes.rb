Rails.application.routes.draw do
  devise_for :users
  # devise_for :admins
  namespace :admin do
    resources :projects, except: [:show]
    post '/projects/hide-project/:id' => 'projects#hide_project', as: :hide_project
  end

  devise_for :admins, path: 'admins', skip: :registrations
  resources :admins, only: [:show]
  
  get '/admin' => 'admins#admin_home'

  resources :projects, only: [:index]
  resources :users, only: [:ensemble]

  get '/donors' => 'projects#index'

  # static pages
  get '/about' => 'home#about'
  get '/community'=> 'home#community'
  get '/ensemble'=> 'users#ensemble'


  root 'home#index'

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
