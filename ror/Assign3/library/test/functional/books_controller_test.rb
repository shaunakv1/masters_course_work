require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  
  fixtures :publishers, :authors
   
   def setup
       @book = books(:one)
       @author = authors(:sv)
       @publisher = publishers(:one)
     end
     
   test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:books)
    end
   
    test "should get new" do
      get :new
      assert_response :success
    end
   
    test "should create book" do
      assert_difference('Book.count') do
      post :create, :book => {:title =>"Ruby" , :author_ids => authors(:sv).to_param, :publisher_id => publishers(:one).to_param}
      end
    end

    test "should not create book " do
      post :create, :book => { }
      assert_response :success
      assert_template 'new'
    end
    
    test "should show book" do
      get :show, :id => books(:one).to_param
      assert_response :success
    end
    
    test "search for a book" do
      post :search, :search => {:query => "rub"}
      assert_response :success
      assert_not_nil assigns(:books)
    end
      
    
    test "should get edit" do
      get :edit, :id => books(:one).to_param
      assert_response :success
    end
   
    test "should update book" do
      put :update, :id => books(:one).to_param, :book => { }
      assert_redirected_to book_path(assigns(:book))
    end

   
    test "should not update book for title as nill " do
      put :update, :id => books(:one).to_param, :book => { :title => nil }
      assert_response :success
      assert_template 'edit'
    end
   
    test "should destroy book" do
      assert_difference('Book.count', -1) do
        delete :destroy, :id => books(:one).to_param
      end
   
      assert_redirected_to root_path
    end

end
