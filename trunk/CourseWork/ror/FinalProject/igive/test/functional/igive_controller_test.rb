require 'test_helper'

class IgiveControllerTest < ActionController::TestCase
  
  fixtures :users, :posts
  
  def setup
    @user = users(:one)
    @post = posts(:one)
    @history = histories(:one)
    @message = messages(:one)
    @request.session[:user_id] = 'Vasundhara'
  end
  
  test "should authenticate" do
    post :authenticate, :userform => {:name => @user.name,:password => @user.password}
    assert_redirected_to home_igive_path
  end
  
  
  test "should not authenticate" do
    post :authenticate, :userform => {:name =>"Vasu",:password => "vasu"}
    assert_redirected_to login_igive_path
  end
  
  test "should logout" do
    post :logout
    assert_redirected_to login_igive_path
  end
  
  test "should set to home" do
    post :home
    assert_response :success       
  end
  
  test "should set to home new post" do
    @request.session[:coming_from] = 'new_post'
    post :home
    assert_response :success       
  end
  
  test "should set to home dib item" do
    @request.session[:coming_from] = 'dib_item'
    post :home
    assert_response :success       
  end
  
  test"should clear notification" do
    post:clear_notifications
    assert_template :partial => '_blank'
    
  end
  
  test "should populate recent post" do
    post :populate_recent_posts
    assert_response :success       
  end
  
end
