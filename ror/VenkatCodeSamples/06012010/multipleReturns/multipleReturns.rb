def muliValues(number)
  if number < 10
    return 4, 7
  else
    return 2, 5, 7
  end
end

puts muliValues(3)
puts muliValues(10)

a, b = muliValues(3)
puts "a is #{a}"
puts "b is #{b}"

c, d = muliValues(10)
puts "c is #{c}"
puts "d is #{d}"

e, *f = muliValues(10)
puts "e is #{e}"
print "f is"
puts f







