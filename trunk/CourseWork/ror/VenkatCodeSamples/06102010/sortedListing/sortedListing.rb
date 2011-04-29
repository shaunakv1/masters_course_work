require '../graduate'

alums = Graduate.find(:all, :order => 'last_name, first_name')

format = "%-25s %-25s %-4s\n"
printf(format, 'First Name', 'Last Name', 'Year of Graduation')
alums.each do |alum|
  printf format, alum.first_name, alum.last_name, alum.year_of_graduation
end

puts "All Johnsons graduated in 1989"
grads = Graduate.find_all_by_last_name_and_year_of_graduation('Johnson', 1989)

grads.each do |grad|
  puts grad.first_name
end