require '../graduate'

alums = Graduate.find_all_by_last_name('Johnson')
alums.each do |alum|
  puts "#{alum.first_name} #{alum.last_name} #{alum.year_of_graduation}"
end
