def compute(number)
  if number < 10
    number
  else
    number * 2
  end
end

def compute2(number)
  result = number
  #result = number * 2 if number >= 10
  result = number * 2 unless number < 10
  result
end

puts compute(2)
puts compute(10)

puts compute2(2)
puts compute2(10)