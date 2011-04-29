require '../graduate'

class Degree < ActiveRecord::Base
end

a_degree = Degree.new(:title => '', :abbr => 'BA')
puts a_degree.valid? # liar, I want it to tell me this is not valid,
#because if I save now, this will fail since several things are wrong.

class Degree 
  validates_presence_of :title
end

puts a_degree.valid? # now it tells us it is false!

a_degree.title = 'Bachelor of Arts'
puts a_degree.valid? #liar again! I want to check for years

class Degree 
  validates_presence_of :years
end

puts a_degree.valid? # false now!

a_degree.years = -2
puts a_degree.valid? # wrong again!

class Degree
  validates_numericality_of :years, :only_integer => true, :greater_than => 0
end

puts a_degree.valid?

puts a_degree.errors.full_messages

a_degree2 = Degree.new(:title => '', :abbr => 'MA')
puts a_degree2.valid?
puts a_degree2.errors.full_messages
