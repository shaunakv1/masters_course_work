require '../graduate'

class Honor < ActiveRecord::Base
  has_and_belongs_to_many :graduates
end

a4ptr = Honor.find(1)
puts a4ptr.title
puts a4ptr.graduates.count #This expects to find a join table.
#by convention, the join table is of the form table1_table2
#where table1 is before table2 in the dictionary
#so it should be graduates_honors (and not honors_graduates)

Graduate.class_eval do
  has_and_belongs_to_many :honors
end

puts "For graduate 1 we have the following honors"
Graduate.find(1).honors.each do |honor|
  puts honor.title
end