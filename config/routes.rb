Rails.application.routes.draw do
  devise_for :users
   
  get 'welcome/index'
  get 'projects' => 'projects#index', as: :projects
  get 'teams' => 'teams#index', as: :teams
  get 'users' => 'users#index', as: :users


  resources :projects
  resources :users
  resources :teams
  
  
  resources :users, :only=>:join do
    member do
        put :join
    end
end
  
  resources :teams  do 
    resources :users do
        member do
            put :join
        end
    end
end

resources :teams do
  resources :projects
end

# resources :users do
# 	resources :posts
# end

# resources :projects do
# 	resources :posts
# end
# resources :posts


    resources :projects do
      resources :posts
      resource :user
    end


# resources :projects do
#   resources :users
#   resources :posts
# end

  
  #get 'persons/profile', as: 'user_root'
  get 'users/:id' => 'user#show'
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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
