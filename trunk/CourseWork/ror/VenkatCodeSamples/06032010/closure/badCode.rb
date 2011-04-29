def totalValues(list)
  total = 0
  for e in list
    total += e
  end
  total
end

def totalEvenValues(list)
  total = 0
  for e in list
    total += e if e % 2 == 0
  end
  total
end

list = [1, 2, 4, 5, 6, 2, 6]
puts totalValues(list)
puts totalEvenValues(list)