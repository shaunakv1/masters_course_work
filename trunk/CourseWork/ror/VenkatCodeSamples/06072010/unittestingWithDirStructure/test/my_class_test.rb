$:.unshift File.join(File.dirname(__FILE__), '..', 'src')
require 'test/unit'
require 'my_class'

class MyClassTest < Test::Unit::TestCase
  def test_foo
    obj = MyClass.new
    assert 0, obj.foo
  end
end