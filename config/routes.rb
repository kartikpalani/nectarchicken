Rails.application.routes.draw do
  resources :products

  resources :bills

  resources :fixed_assets

  resources :balance_sheets

  resources :employees

  resources :vendors

  resources :customers

  get 'static_pages/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  root 'static_pages#index'

  match "/pay/:id" => "employees#pay", as:"pay" ,:via => [:get, :post]
  match "/bill/pay/:id" => "bills#pay", as:"pay_bill" ,:via => [:get, :post]

  match "/payroll" => 'employees#payroll', as:"payroll",:via => [:get, :post]

  match "/incomestatement" => 'balance_sheets#incomestatement', as:"income",:via => [:get, :post]

  match "/buy/:id" => "products#buy", as:"buy", :via => [:get, :post]
  match "/sell/:id" => "products#sell", as:"sell", :via => [:get, :post]

  match "/purchase/:id" => "products#purchase", as:"purchase", :via => [:get, :post]  # The priority is based upon order of creation: first created -> highest priority.
  match "/hawk/:id" => "products#hawk", as:"hawk", :via => [:get, :post]

  match "/pay_tax" => "static_pages#pay_tax", as:"pay_tax", :via => [:get, :post]
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
