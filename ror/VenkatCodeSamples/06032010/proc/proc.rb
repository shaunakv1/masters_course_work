def foo(list) 
  for e in list
    yield e
  end
end

def foo1(list, &proc)
  puts proc.class
  puts proc.call(2)
end

list = [1, 2, 4, 6, 7]
foo(list) { |e| puts e }

foo(list) do |e|
  puts e
end

foo1(list) { |e| puts e }