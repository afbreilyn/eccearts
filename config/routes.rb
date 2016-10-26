Rails.application.routes.draw do
  devise_for :users
  # devise_for :admins
  namespace :admin do
    resources :projects, except: [:show]
    post '/projects/hide-project/:id' => 'projects#hide_project', as: :hide_project
    resources :projects do
      post :update_row_order, on: :collection
    end
    resources :users, except: [:show]
    get '/ensemble-members' => 'users#ensemble', as: :ensemble
    post '/users/hide-ensemble-memeber/:id' => 'users#hide_ensemble_member', as: :hide_ensemble_member

    resources :items, except: [:show]
    post '/itmes/hide-item/:id' => 'items#hide_item', as: :hide_item
    resources :items do
      post :update_row_order, on: :collection
    end
    resources :categories, only: [:new, :create, :destory, :index]
    resources :photos
  end

  devise_for :admins, path: 'admins', skip: :registrations
  resources :admins, only: [:show]
  
  get '/admin' => 'admins#admin_home'

  resources :projects, only: [:index]
  get '/our_season/' => 'projects#index', as: :our_season

  resources :photos, only: [:index]

  resources :users, only: [:ensemble]

  resources :items, only: [:index]
  get '/donate' => 'items#index', as: :donate
  get '/contribute' => 'items#index', as: :contribute

  # static pages
  get '/about' => 'home#about'
  get '/community' => 'home#community'
  get '/ensemble' => 'users#ensemble'
  get '/videos' => 'home#videos'
  get '/press' => 'home#press'
  get 'home/download_pdf' => 'home#download_pdf'

  get 'etchings' => 'home#etchings'

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
