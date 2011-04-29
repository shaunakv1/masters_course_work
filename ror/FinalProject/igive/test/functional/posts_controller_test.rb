require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  fixtures :users, :histories, :messages
  
  def setup
    @user = users(:one)
    @post = posts(:one)
    @history = histories(:one)
    @message = messages(:one)
    @request.session[:user_id] = 'Shaunak'
    
  end
  
  # test "search for a book" do
  #   post :search, :search => {:query => "rub"}
  #   assert_response :success
  #   assert_not_nil assigns(:books)
  # end
  
  test "should get list" do
    get :list, :searchform => {:query => "book"}
    assert_response :success
    assert_not_nil assigns(:posts)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end
  
  test " should withdraw dib" do
    post :withdraw_dib, :id => posts(:one).to_param
    assert_redirected_to home_igive_path
    
  end
  test " should accept dib" do
    post :accept_dib, :id => posts(:dibbed).to_param
    assert_redirected_to pending_dibs_posts_path          
  end
  
  test " should reject dib" do
    post :reject_dib, :id => posts(:dibbed).to_param
    assert_redirected_to pending_dibs_posts_path          
  end    
  
  test "should create post" do
    assert_difference('Post.count') do
      post :create, :post => {:title => "laptop", :description => "brand new laptop", :tag =>"electronic", :user_id => 1, :dibber => 1, :exchanged =>"false" }
    end
    assert_redirected_to home_igive_path #post_path(assigns(:post))
  end
  
  test "should not create post " do
    put :create, :post => { :title => nil }
    assert_response :success
    assert_template 'new'
  end
  
  test "should show post" do
    get :show, :id => posts(:one).to_param
    assert_response :success
  end
  
  test "should get edit" do
    get :edit, :id => posts(:one).to_param
    assert_response :success
  end
  
  test "should not update post " do
    put :update, :id => posts(:one).to_param, :post => { :title => nil }
    assert_response :success
    assert_template 'edit'
  end
  
  test "should update post" do
    put :update, :id => posts(:one).to_param, :post => { }
    assert_redirected_to post_path(assigns(:post))
  end
  
  test "should post new" do
    post :new, :post =>{ }
    assert_response :success
    assert_template :new
  end
  
  # test "should not post new" do
  #        post :new, @request.session[:user_id] = nil
  #        assert_redirected_to login_igive_path
  #      end
  
  # test "should not post new" do
  # 
  # end
  
  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:one).to_param
    end
    assert_redirected_to root_path
  end
end
