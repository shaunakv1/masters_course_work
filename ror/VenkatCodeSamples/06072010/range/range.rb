range = 1...10

puts range.include? 5
puts range.include? 10
puts range.include? 0

range = 'a'..'f'
puts range.include? 'b'
puts range.include? 'g'
puts range.include? 'B'

range = 'hell'..'help'
puts range.include? 'hell'
puts range.include? 'hello'
puts range.count
for e in range
  puts e
end