require 'test_helper'

class DegreeTest < ActiveSupport::TestCase
  
  def setup
    @degree = Degree.create(:title => 'Bachelor of Arts', :name => 'BA', :years => 4)
  end
  
  test "create degree" do
    count = Degree.count
    Degree.create(:title => "something", :name => 'somename', :years => 12)
    assert_equal count+1, Degree.count
  end
  
  test "update a degree" do
    @degree.years = 5
    assert @degree.save
  end
  
  test "degree requires name" do
    @degree.name = nil
    assert !@degree.valid?
  end
  
  #... other tests for validations, etc...
end
