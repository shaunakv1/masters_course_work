require 'test_helper'

class PublishersControllerTest < ActionController::TestCase
  test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:publishers)
    end
   
    test "should get new" do
      get :new
      assert_response :success
    end
      
     test "should create publisher" do
        assert_difference('Publisher.count') do
        post :create, :publisher => {:name => "Oreilly" }
      end 
      assert_redirected_to publisher_path(assigns(:publisher))
      end
             
       test "should not create publisher " do
         post :create, :publisher => { }
         assert_response :success
         assert_template 'new'
       end
    
    
    test "should show publisher" do
      get :show, :id => publishers(:one).to_param
      assert_response :success
    end
   
    test "should get edit" do
      get :edit, :id => publishers(:one).to_param
      assert_response :success
    end
   
    test "should show books of publisher" do
       get :show_books_of_publisher, :id => publishers(:one).to_param
       assert_response :success
    end
      
    test "should update publisher" do
      put :update, :id => publishers(:one).to_param, :publisher => { }
      assert_redirected_to publisher_path(assigns(:publisher))
    end
 
    test "should not update publisher " do
      put :update, :id => publishers(:one).to_param, :publisher => { :name => nil }
      assert_response :success
      assert_template 'edit'
    end
       
    test "should destroy publisher" do
      assert_difference('Publisher.count', -1) do
      delete :destroy, :id => publishers(:three).to_param
     end     
     assert_redirected_to root_path
    end
    
    test "should not destroy publisher" do
       assert_difference('Publisher.count', 0) do
      delete :destroy, :id => publishers(:one).to_param
    end
  end
 end
