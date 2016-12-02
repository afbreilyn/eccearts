Rails.application.routes.draw do
  
  devise_for :users

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
  get 'home/download_retrospective' => 'home#download_retrospective'

  get 'etchings' => 'home#etchings'
  get 'etchings_pics' => 'home#etchings_pics'
  get 'etchings_2017' => 'home#etchings_2017'
  get 'etchings_composers_faculty' => 'home#etchings_composers_faculty'
  get 'etchings_dancers_faculty' => 'home#etchings_dancers_faculty'
  get 'etchings_ensemble' => 'home#etchings_ensemble'
  get 'etchings_app' => 'home#etchings_app'

  root 'home#index'
end
