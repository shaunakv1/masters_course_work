class Human
  def initialize(name)
    @name = name
  end
  def listen
    puts "I'm #{@name} your friend, listening..."
  end
end

class Dog
  def initialize(name)
    @name = name
  end
  def listen
    puts "I'm #{@name} your friend, listening..."
  end
end

peter = Human.new('Peter')
peter.listen

snow = Dog.new("Snow")
snow.listen

def seekHelp(friend)
  friend.listen
end

seekHelp peter
seekHelp snow