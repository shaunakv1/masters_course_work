def max(*values)
  values.max
end

puts max(1, 7, 2, 4, 5, 6)
puts max(2, 3, 1, 6)
array = [2, 3, 1]
puts max(*array)