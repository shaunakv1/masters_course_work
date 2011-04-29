require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = messages(:one)
    @user = users(:three)
  end
  
  test "send sender name" do
    assert_equal "venkat", @message.sender_name         
  end
  
  test "who said returns you" do
    
    assert_equal "You", @message.who_said('venkat')
    
  end
  
  test "who said returns name" do
    
    assert_equal "venkat",  @message.who_said('someone')
    
  end
  
  
end
