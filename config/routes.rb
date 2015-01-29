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

  resources :faqs, only: :index, path: :help
  resource :terms, only: :show
  resource :agreements, only: :show

  resources :categories, only: :show

  resources :password_resets, only: [:create, :edit, :update]

  resources :projects do
    collection do
      get :tags, as: :tags
    end
    resources :reports, exclude: :index
    resources :payments, only: [:new, :create]
  end

  # get 'my-projects', to: 'projects#index', as: :my_projects, pr: 'my'
  get 'tags/:tag', to: 'projects#index', as: :tag

  resources :foundations, only: [:show]

  resources :user_sessions

  resources :users, except: [:index, :destroy]
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

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  get 'sitemap' => 'pages#sitemap'
  root 'pages#index'

  # constraints(AdminConstraint) do
  #   namespace :admin do
  #   # mount Resque::Server, at: '/resque'
  #     root to: 'dashboard#show', as: :dashboard
  #   end
  # end

end
