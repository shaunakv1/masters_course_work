require 'test_helper'

class GraduatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graduates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graduate" do
    assert_difference('Graduate.count') do
      post :create, :graduate => { }
    end

    assert_redirected_to graduate_path(assigns(:graduate))
  end

  test "should show graduate" do
    get :show, :id => graduates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => graduates(:one).to_param
    assert_response :success
  end

  test "should update graduate" do
    put :update, :id => graduates(:one).to_param, :graduate => { }
    assert_redirected_to graduate_path(assigns(:graduate))
  end

  test "should destroy graduate" do
    assert_difference('Graduate.count', -1) do
      delete :destroy, :id => graduates(:one).to_param
    end

    assert_redirected_to graduates_path
  end
end
