require '../graduate'

steve = Graduate.new
steve.first_name = 'Steve'
steve.middle_name = 'Buddy'
steve.last_name = "Williams"
steve.year_of_graduation = 2006

puts Graduate.count
steve.save
puts Graduate.count

Graduate.new(:first_name => 'Bob', 
 :last_name => 'Smith', :middle_name => "",
 :year_of_graduation => 2009).save

puts Graduate.count
