require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  
  
  def setup
    @user = users(:one)
    @post = posts(:one)
    @history = histories(:one)
    @message = messages(:one)
    @request.session[:user_id] = 'Shaunak'
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
end
