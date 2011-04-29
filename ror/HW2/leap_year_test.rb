require 'test/unit'
require 'leap_year'
class LeapYearTest < Test::Unit::TestCase
  
  def LeapYearTest.test_synthesis
    File.open "testdata.dat", "r" do |file|
      while (line = file.gets) 
        year, expected = line.split 
        class_eval( "def test_is_leap_#{year}; assert_equal(#{expected},#{LeapYear.new.isleap?(year.to_i)}) ; end")
      end
      
    end
  end
  
end
LeapYearTest.test_synthesis