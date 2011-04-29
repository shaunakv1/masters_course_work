require 'rubygems'
require 'active_record'
require '../dbinfo'

class Graduate < ActiveRecord::Base
end

alum = Graduate.find(1)
puts alum.first_name

puts Graduate.instance_methods