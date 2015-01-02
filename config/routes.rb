# class AdminConstraint
#   def self.matches?(request)
#     if request.session[:user_id]
#       @current_user = User.find_by(:id, request.session[:user_id])
#       !!@current_user.try(:admin?)
#     end
#   end
# end

Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories, only: :show

  resources :password_resets, only: [:create, :edit, :update]

  resources :projects do
    collection do
      get :tags, as: :tags
    end
    resources :reports, exclude: :index
  end
  get 'my-projects' => 'projects#index', as: :my_projects, pr: 'my'

  resources :foundations

  resources :user_sessions

  resources :users
  get 'login' => 'user_sessions#new', as: :login
  post 'logout' => 'user_sessions#destroy', as: :logout
  get 'signup' => 'registrations#new', as: 'signup'
  get 'profile' => 'users#edit', as: 'profile'
  post 'profile' => 'registrations#update', as: 'update_profile'
  resources :registrations, except: [:index, :show, :update, :destroy]
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  post '/api/liqpay_callback' => 'payments#liqpay_callback', as: :liqpay_callback
  root 'pages#index'


  # constraints(AdminConstraint) do
  #   namespace :admin do
  #   # mount Resque::Server, at: '/resque'
  #     root to: 'dashboard#show', as: :dashboard
  #   end
  # end

  # root to: 'admin#dashboard', constraints: RouteConstraints::AdminRequiredConstraint.new
  # root to: 'home#welcome', constraints: RouteConstraints::NoUserRequiredConstraint.new

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
