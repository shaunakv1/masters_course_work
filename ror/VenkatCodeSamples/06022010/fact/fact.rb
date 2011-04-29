def fact1(number)
  if number <= 1
    1
  else
    number * fact1(number - 1)
  end
end

def fact2(number)
  factorial = 1
  for i in 1..number
    factorial *= i
  end
  factorial
end

def fact3(number)
  factorial = 1
  number.times { |i| factorial *= i+1 }
  factorial
end

puts fact1(5)
puts fact2(5)
puts fact3(5)