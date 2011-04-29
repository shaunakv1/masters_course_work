require 'test_helper'

class PublishersControllerTest < ActionController::TestCase
  
  test "should create publisher" do
    assert_difference('Publisher.count') do
      post :create, :publisher => {:name => "Oreilly" }
    end 
    assert_template :partial => '_list'
  end
  
  test "should create new publisher form" do
    post :create_new_publisher_form
    assert_template :partial => '_new'
  end
  
  test "should edit publisher form" do
    post :edit_publisher_form, :id => publishers(:one).to_param
    assert_template :partial => 'new'
  end
  
  test "should not create publisher " do
    post :create, :publisher => { }
    assert_template :partial => '_err'
  end
  
  
  test "should show books of publisher" do
    get :show_books_of_publisher, :id => publishers(:one).to_param
    assert_response :success
  end
  
  test "should update publisher" do
    put :update, :id => publishers(:one).to_param, :publisher => { }
    assert_template :partial => '_list'
  end
  
  test "should not update publisher " do
    put :update, :id => publishers(:one).to_param, :publisher => { :name => nil }
    assert_template 'err'
  end
  
  test "should destroy publisher" do
    assert_difference('Publisher.count', -1) do
      delete :destroy, :id => publishers(:three).to_param
    end     
    assert_template :partial => '_list'
  end
  
  test "should not destroy publisher" do
    assert_difference('Publisher.count', 0) do
      delete :destroy, :id => publishers(:one).to_param
    end
  end
end
