x = 1
puts x
puts x.class
x = 'hello'
puts x
puts x.class

val = 1000000000000000
for i in 1..6
  val *= 10
  puts val
  puts val.class
end

puts "-------------------"
for i in 1..6
  val /= 10
  puts val
  puts val.class
end
