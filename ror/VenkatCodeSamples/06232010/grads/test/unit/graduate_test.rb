require 'test_helper'

class GraduateTest < ActiveSupport::TestCase
  #test for the model itself should be here...
  
  fixtures :degrees
  
  test "create graduate" do
    grad = Graduate.new(:first_name => 'John',
     :last_name => 'Smith', :year_of_graduation => 2010)
     
    grad.degree = degrees(:mba)
    assert grad.save
  end
end
