ActionController::Routing::Routes.draw do |map|
  map.resources :authors
  map.resources :publishers
  map.resources :books
  
  map.resources :books, :collection => { :search => [:post] }
  map.show_book 'books/:id/show_book', :controller => 'books', :action => 'show_book'
  map.show_books_of_author 'authors/:id/show_books_of_author', :controller => 'authors', :action => 'show_books_of_author'
  map.show_books_of_publisher 'publishers/:id/show_books_of_publisher', :controller => 'publishers', :action => 'show_books_of_publisher'
  map.edit_book_form 'books/:id/edit_book_form', :controller => 'books', :action => 'edit_book_form'
  map.create_new_form 'books/create_new_form', :controller => 'books', :action => 'create_new_form'
  map.edit_author_form 'authors/:id/edit_author_form', :controller => 'authors', :action => 'edit_author_form'
  map.clear_notifications 'library/clear_notifications', :controller => 'library', :action => 'clear_notifications'
  map.edit_publisher_form 'publishers/:id/edit_publisher_form', :controller => 'publishers', :action => 'edit_publisher_form'
  map.create_new_publisher_form 'publishers/create_new_publisher_form', :controller => 'publishers', :action => 'create_new_publisher_form'
  map.create_new_author_form 'authors/create_new_author_form', :controller => 'authors', :action => 'create_new_author_form'
  
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
  
  map.root :controller =>'library',:action => 'home'
end
