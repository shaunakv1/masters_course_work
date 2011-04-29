list = [1, 2, 3, 4, 5, 8]

list.each { |e| puts e }
puts "---"
puts list.find { |e| e > 4 }
puts list.find { |e| e < 4 }
puts "----"
puts list.find_all { |e| e < 4 }
puts "----"
puts "double values"
doubled = []
for e in list
  doubled << e * 2
end
puts doubled
puts "-------"
puts "double values"
puts list.collect { |e| e * 2 }
puts list.join(',')

total = 0
list.each { |e| total += e }
puts "Total is #{total}"

print "Total is "
puts list.inject(0) { |carryover, e| carryover + e }