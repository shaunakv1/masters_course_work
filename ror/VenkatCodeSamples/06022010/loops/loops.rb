number = 5
for i in 1..number
  puts i
end
puts "------"
number.times { |i| puts i }
puts "------"
1.upto(number) { |i| puts i }

puts "------"

for ch in 'a'..'e'
  puts ch
end
puts "------"

for i in 1...number
  puts i
end