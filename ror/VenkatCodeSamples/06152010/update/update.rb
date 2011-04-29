require '../graduate'

venkat = Graduate.find_by_first_name('Venkat')
puts venkat.year_of_graduation
venkat.year_of_graduation = 1990
puts venkat.year_of_graduation
venkat.save