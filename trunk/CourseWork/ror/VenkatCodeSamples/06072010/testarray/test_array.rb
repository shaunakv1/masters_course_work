require 'test/unit'

class TestArray < Test::Unit::TestCase
  def setup
    @array = []
  end
  
  def test_new_array
    assert 0, @array.count
  end
  
  def test_insert_element
    @array << "one"
    assert 1, @array.count
    assert "one", @array.first
  end
  
  def test_divide_by_zero
    assert_raise(ZeroDivisionError) { 3/0 }
  end
end