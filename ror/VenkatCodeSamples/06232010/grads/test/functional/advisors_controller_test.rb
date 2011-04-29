require 'test_helper'

class AdvisorsControllerTest < ActionController::TestCase
  test "should display graduates in year 2009" do
    post :display, :year => 2009
    
    assert_response :success
    assert_template "display.html.erb"
    assert_not_nil assigns(:graduates)
  end

  test "should  not display graduates in year 1900" do
    post :display, :year => 1900
    
    assert_response :success
    assert_template "display_no_grads.html.erb"
    assert_not_nil assigns(:graduates)
  end
  
end