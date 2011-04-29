str = 'hello'

#class<<str
#  def encrypt
#    "&^%&*^"
#  end
#end

#------------------

#module Encrypt
#  def encrypt
#    "&^%&*^"
#  end
#end
#
#str.extend Encrypt

def str.encrypt
  "&^%&*^"
end

puts str.encrypt
