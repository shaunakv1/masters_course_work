require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  
  test "should create author" do
    assert_difference('Author.count', difference=1) do
      post :create, :author => {:first_name => "Venkat", :last_name => "Subramanium" }
    end
    
    assert_template :partial => '_list'
    
  end
  
  test "should create new author form" do
    post :create_new_author_form
    assert_template :partial => '_new'
  end
  
  test "should not create author " do
    post :create, :author => { }
    assert_template :partial => '_err'
    
  end
  
  test "should edit author form" do
    post :edit_author_form, :id => authors(:vs).to_param
    assert_template :partial => 'new'
  end
  
  test "should show books of author" do
    get :show_books_of_author, :id => authors(:vs).to_param
    assert_response :success
  end
  
  test "should update author" do
    put :update, :id => authors(:vs).to_param, :author => { }
    
    assert_template 'list'
  end
  
  test "should not update author " do
    put :update, :id => authors(:vs).to_param, :author => { :first_name => nil }
    assert_template 'err'
  end
  
  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, :id => authors(:ab).to_param
    end
    assert_template :partial => '_list'
  end
  
  test "should not destroy author" do
    assert_difference('Author.count', 0) do
      delete :destroy, :id => authors(:vs).to_param
    end
  end
  
end
