require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
    @post = posts(:one)
    @history = histories(:one)
    @message = messages(:one)
    @request.session[:user_id] = 'Shaunak'
  end
  
  test "should show message" do
    post :show_message, :id => messages(:one).to_param
    assert_template 'message'
  end
  
  test "should new message" do
    post :new, :post_id => messages(:one).to_param
  end
  
  test "should show reply box" do
    post :show_reply_box, :id => posts(:one).to_param
    assert_template 'reply_box'
  end
  
  test "should create message" do
    post :create, :message => {:subject =>" rejected",
                  :body => "your dib got rejected",
      :sender_id => 1,
      :user_id => 1,
      :read => false}
    assert_redirected_to home_igive_path
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end
  
  test "should reply to message"do
  get :reply, :message => {:subject =>" rejected",
                :body => "your dib got rejected",
    :sender_id => 1,
    :user_id => 1,
    :read => false}
  assert_template 'notify'
end


end
