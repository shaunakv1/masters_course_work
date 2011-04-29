class Foo
  def fn(val)
    return 10
  end
  def bar=(val)
    return 10
  end
end

foo = Foo.new
puts foo.fn(2)
puts foo.bar = 2