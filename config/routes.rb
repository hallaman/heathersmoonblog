Rails.application.routes.draw do

  resources :sidebars
  resources :issues
  root :to => 'moon_vibe_guide#index'

  get 'welcome/index'

  get 'moon_vibe_guide/index'
  get 'moon_vibe_guide/issues'

  match "/moonvibeguide", to: "moon_vibe_guide#index", :via => 'get'
  match "/moonvibeguide/issues", to: "moon_vibe_guide#issues", :via => 'get'

  devise_for :members, :path => '', :path_names => {  sign_in: 'login', sign_out: 'logout', sign_up: 'join', password: 'member_password', registration: 'member_registration' }, 
  controllers: { sessions: 'sessions', registrations: "registrations" }

  devise_scope :member do
    get 'logout', to: 'devise/sessions#destroy'
  end

  get 'issues/index'
  get 'issues/new'
  get 'issues/create'
  get 'issues/show'
  get 'issues/edit'

  devise_for :admins, :path => '', :path_names => {  sign_in: 'admin', sign_out: 'logout_admin', sign_up: 'create_admin', password: 'password_admin', registration: 'register_admin' }, controllers: {
    sessions: 'admins/sessions'
  }

  devise_scope :admins do
    get 'logout', to: 'devise/sessions#destroy'
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
