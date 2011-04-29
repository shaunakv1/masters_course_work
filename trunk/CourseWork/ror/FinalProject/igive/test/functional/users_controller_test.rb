require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
    @post = posts(:one)
    @request.session[:user_id] = 'Vasundhara'
    
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => {:name =>"Shaun", :password =>"Shaun", :email => "shaun@gmail.com" }
    end
    assert_redirected_to login_igive_path
  end
  
  
  test "should not create user " do
    post :create, :user => { }
    assert_response :success
    assert_template 'new'
  end
  
  test "should show user" do
    get :show, :id => users(:one).to_param
    assert_response :success
  end
  
  test "should get edit" do
    get :edit
    assert_response :success
    # assert_redirected_to edit_user_path
  end
  
  test "should update user" do
    put :update, :id => users(:one).to_param, :user => { }
    assert_redirected_to user_path(assigns(:user))
  end
  
  test "should not update user " do
    put :update, :id => users(:one).to_param, :user => { :name => nil }
    assert_response :success
    assert_template 'edit'
  end
  
  
  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:one).to_param
    end
    
    assert_redirected_to users_path
  end
end
