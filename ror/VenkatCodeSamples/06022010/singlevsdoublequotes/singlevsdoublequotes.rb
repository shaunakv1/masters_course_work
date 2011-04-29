str1 = 'hello world'
puts str1
str2 = "hello world"
puts str2

value = 4
str3 = 'hello the value is #{value}'
str4 = "hello the value is #{value}"

puts str3
puts str4
value = 5
puts str4

numbers = ['one', 'two', 'three']
puts numbers
numbers = %w{one two three}
puts numbers

#message = "This is a message"
#message += "written on ..."

message = <<UNTILYOUSEETHIS
 This is a message
 witten on ...
 whatever...
UNTILYOUSEETHIS

puts message

 message = <<-UNTILYOUSEETHIS
 THis is another message, indented
 here...
 UNTILYOUSEETHIS
 
puts message