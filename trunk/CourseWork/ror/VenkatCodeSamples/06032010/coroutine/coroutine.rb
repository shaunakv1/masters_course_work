def foo(list)
  puts "here in foo"
  list.each do |e| 
    puts "working with #{e}"
    yield e 
  end
  puts "exiting foo"
end

list = [1, 5, 2, 7, 4, 6]
puts "calling foo..."
foo(list) do |e|
  puts "recevied #{e} for processing here..."
end
puts "back from foo..."