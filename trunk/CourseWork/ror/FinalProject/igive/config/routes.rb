ActionController::Routing::Routes.draw do |map|
  map.resources :messages

  map.resources :histories

  # map.resources :users
   
  map.resources :igive, :collection => { :home => [:get, :post] , :login => [:get, :post] , :authenticate => [:get, :post] , :logout => [:get, :post] ,:search => [:get, :post]}
  map.resources :posts, :collection => { :list => [:get, :post], :pending_dibs => [:get] }
  map.resources :users, :collection => { :edit => [:get, :post]}
  map.resources :posts, :collection => { :auto_complete_for_post_title => :get }
  map.resources :messages, :collection => { :reply => [:post] }  
  map.clear_notifications 'igive/clear_notifications', :controller => 'igive', :action => 'clear_notifications'
  map.populate_recent_posts 'igive/populate_recent_posts', :controller => 'igive', :action => 'populate_recent_posts'
  map.edit 'users/edit', :controller => 'users', :action => 'edit'
  map.dib 'posts/:id/dib', :controller => 'posts', :action => 'dib'
  map.withdraw_dib 'posts/:id/withdraw_dib', :controller => 'posts', :action => 'withdraw_dib'
  map.reject_dib 'posts/:id/reject_dib', :controller => 'posts', :action => 'reject_dib'
  map.accept_dib 'posts/:id/accept_dib', :controller => 'posts', :action => 'accept_dib'
  
  map.show_message 'messages/:id/show_message', :controller => 'messages', :action => 'show_message'
  map.show_reply_box 'messages/:id/show_reply_box', :controller => 'messages', :action => 'show_reply_box'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
  
  map.root :controller =>'igive',:action => 'home'
end
