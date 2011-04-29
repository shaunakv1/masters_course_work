require '../graduate'

venkat = Graduate.find_by_first_name('Venkat')
puts Graduate.count
venkat.year_of_graduation = 1995
venkat.delete
#venkat.year_of_graduation = 1995
puts venkat.year_of_graduation
puts Graduate.count