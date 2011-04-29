require '../faculty'
require '../graduate'
require '../degree'

Faculty.find(:all).each do |faculty|
  puts "#{faculty.first_name} #{faculty.last_name}"
end

billy = Graduate.new(:first_name => 'Billy', :last_name => 'Willy',
:middle_name => '', :year_of_graduation => 2009)
billy.degree = Degree.find_by_abbr('BS')
billy.advisor = Faculty.find(1)
billy.save

aGraduate = Graduate.find_by_last_name('Willy')
puts "Mr. #{aGraduate.last_name}'s advisor is #{aGraduate.advisor.last_name}"