require 'test_helper'

class LibraryControllerTest < ActionController::TestCase
  
  test "should clear notification" do
    post :clear_notifications
    assert_template 'blank'
  end
end
