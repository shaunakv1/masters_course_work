str = "Hello"
puts str

puts str.methods.size
class String
  def shout
    upcase
  end
end
puts str.methods.size
puts str.shout

String.class_eval do
  def wisper
    downcase
  end
end

puts str.wisper
puts str

str2 = "What"
puts str2.wisper
puts str2.shout

class <<str
  def encrypt
    '$%^*#'
  end
end

puts str.encrypt 

puts str2.encrypt