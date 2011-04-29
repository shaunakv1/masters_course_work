module UppercaseFilter
  def writeMsg(msg)
    puts "in uppercase"
    super(msg.upcase)
  end
end

module ProfanityFilter
  def writeMsg(msg)
    puts "in profanity"
    super(msg.sub('stupid', 's*****'))
  end
#  def foo
#    puts "foo called here..."
#  end
end

class Writer
  def writeMsg(msg)
    msg
  end
end

class Writer1 < Writer
  include UppercaseFilter
end

writer1 = Writer1.new
puts writer1.writeMsg('hello')

class Writer2 < Writer
  include ProfanityFilter
end

writer2 = Writer2.new
puts writer2.writeMsg('This is stupid')

class Writer3 < Writer
  include UppercaseFilter
  include ProfanityFilter
end

writer3 = Writer3.new
puts writer3.writeMsg('This is stupid!!')

class Writer4 < Writer
  include ProfanityFilter
  include UppercaseFilter
  
  def method_missing(name, *args)
    puts "you got to method missing!!!"
  end
end

writer4 = Writer4.new
puts writer4.writeMsg('This is stupid!!!')

writer4.foo