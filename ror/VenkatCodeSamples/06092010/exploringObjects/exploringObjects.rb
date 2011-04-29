class MyClass
end

obj = MyClass.new
puts obj.inspect

str = "hello"
puts str.inspect


str.upcase!
puts str

puts str.frozen?

str.freeze
puts str
begin
  str.upcase!
rescue => e
  puts "error: #{e}"
end

puts str.frozen?


