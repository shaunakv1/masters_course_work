require '../graduate'
require '../degree'

smith = Graduate.find_by_last_name('Smith')
print "#{smith.first_name} #{smith.last_name} graduated in "
puts "#{smith.year_of_graduation} with a #{smith.degree_id}"

degree_id = smith.degree_id
degree = Degree.find(degree_id)

print "#{smith.first_name} #{smith.last_name} graduated in "
puts "#{smith.year_of_graduation} with a #{degree.abbr}"