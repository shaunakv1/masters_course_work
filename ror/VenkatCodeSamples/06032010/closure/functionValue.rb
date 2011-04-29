def totalSelectValues(list)
  total = 0
  for e in list
    total += e if yield e
  end
  total
end

list = [1, 2, 4, 5, 6, 2, 6]
puts totalSelectValues(list) { |e| true }
puts totalSelectValues(list) { |e| e % 2 == 0 }
puts totalSelectValues(list) { |e| e % 2 != 0 }
puts totalSelectValues(list) { |e| e > 4 }
result = totalSelectValues(list) do |e| 
  e > 4 && e % 2 == 0 
end
puts result