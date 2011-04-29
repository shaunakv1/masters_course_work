puts $:
puts "----"
puts $:.class
puts $:.unshift 'blah'
puts File.dirname(__FILE__)