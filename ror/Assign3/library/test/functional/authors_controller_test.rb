require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  
  test "should get index" do
       get :index
       assert_response :success
       assert_not_nil assigns(:authors)
     end
      
   test "should get new" do
       get :new
       assert_response :success
    end
   
   test "should create author" do
     assert_difference('Author.count', difference=1) do
       post :create, :author => {:first_name => "Venkat", :last_name => "Subramanium" }
     end
   
     assert_redirected_to author_path(assigns(:author))
     assert_equal 'Author was successfully created.', flash[:notice]
     
     end
     
     test "should not create author " do
       post :create, :author => { }
       assert_response :success
       assert_template 'new'
     end
  
   test "should show author" do
         get :show, :id => authors(:vs).to_param
         assert_response :success
  end              
  
    test "should show books of author" do
          get :show_books_of_author, :id => authors(:vs).to_param
          assert_response :success
     end    
      
   test "should get edit" do
       get :edit, :id => authors(:vs).to_param
       assert_response :success
   end
      
   test "should update author" do
       put :update, :id => authors(:vs).to_param, :author => { }
       assert_equal 'Author was successfully updated.', flash[:notice]
       
       assert_redirected_to author_path(assigns(:author))
   end
   
   test "should not update author " do
     put :update, :id => authors(:vs).to_param, :author => { :first_name => nil }
     assert_response :success
     assert_template 'edit'
   end
    
   test "should destroy  author" do
       assert_difference('Author.count', -1) do
       delete :destroy, :id => authors(:ab).to_param
     end    
       assert_redirected_to root_path
     end
   
     test "should not destroy author" do
       assert_difference('Author.count', 0) do
      delete :destroy, :id => authors(:vs).to_param
      end
    end
 
end
