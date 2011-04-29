require 'rubygems'
require 'active_record'
require '../dbinfo'

class Graduate < ActiveRecord::Base
end

class Degree < ActiveRecord::Base
end

puts Graduate.instance_methods.count
methods_before_belongs = Graduate.instance_methods

Graduate.class_eval do
  belongs_to :degree
end

puts Graduate.instance_methods.count
methods_after_belongs = Graduate.instance_methods

puts methods_after_belongs - methods_before_belongs

smith = Graduate.find_by_last_name('Smith')

print "#{smith.first_name} #{smith.last_name} graduated in "
puts "#{smith.year_of_graduation} with a #{smith.degree.abbr}"

puts "----"
bs = Degree.find(1)
puts bs.abbr

begin
every_one_with_a_bs = bs.graduates
puts every_one_with_a_bs.count
rescue => err
  puts "oops... #{err}"
end

puts Degree.instance_methods.count
methods_before_has_many = Degree.instance_methods

Degree.class_eval do
  has_many :graduates
end

puts Degree.instance_methods.count
methods_after_has_many = Degree.instance_methods

puts methods_after_has_many - methods_before_has_many

every_one_with_a_bs = bs.graduates
puts every_one_with_a_bs.count
puts "They are #{every_one_with_a_bs.map { |g| g.first_name }.join(', ')}"