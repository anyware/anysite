Anysite::Application.routes.draw do
  # resources :templates

  namespace :admin do
      #Directs /admin/templates/* to Admin::TemplatesController
      # (app/controllers/admin/products_controller.rb)
      resources :templates
      resources :contents do
        resources :comments
      end
      resources :folders
      resources :resources
      match 'index' => 'admin#index'
      match 'contents/tree_node/:id' => 'contents#tree_node'
      match 'folders/tree_node/:id' => 'folders#tree_node'
      match 'resources/update_positions' => 'resources#update_positions'
      match 'contents/order' => 'contents#order'
      match 'contents/order_resources' => 'contents#order_resources'
      match 'folders/order_folders' => 'folders#order_folders'
      match 'folders/order_resources' => 'folders#order_resources'
      match 'contents/import/:id/:type/:object_id' => "contents#import"
      #, :as => :tree_node
      match 'lorem' => 'admin#lorem'
  end
  
  # namespace :site do
  #   match ':id' => 'contents#show'
  # end
  
  namespace :site do
    match '*url' => 'contents#by_url'
  end
  
  match 'contact_us' => 'email#contact_us'
      
  # match 'admin' => 'admin/admin#index'

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "site/contents#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
