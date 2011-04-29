require '../degree'

Degree.find(:all).each do |degree|
  puts "#{degree.abbr} #{degree.years}"
end