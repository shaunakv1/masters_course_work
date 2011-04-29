require '../graduate'

format = "%-25s %-25s %-4s\n"
printf(format, 'First Name', 'Last Name', 'Year of Graduation')
Graduate.find(:all).each do |alum|
  printf(format, alum.first_name, alum.last_name, alum.year_of_graduation)
end