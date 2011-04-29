module Math
  def Math.sqr(number)
    number * number
  end
  
  def self.add(number1, number2)
    number1 + number2
  end

  def mult(number1, number2)
    number1 * number2
  end
end

puts Math.sqr(4)
puts Math.add(4, 5)
begin
  puts Math.mult(4, 5)
rescue => e
  puts "oops #{e}"
end