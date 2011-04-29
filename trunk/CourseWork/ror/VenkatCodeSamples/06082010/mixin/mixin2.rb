module Friend
  def listen
    puts "I'm #{@name} your friend, listening..."
  end
end

class Human
  include Friend
  def initialize(name)
    @name = name
  end
end

class Dog
  include Friend
  def initialize(name)
    @name = name
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

class Cat
  def initialize(name)
    @name = name
  end
end

rasputin = Cat.new('Rasputin')
class<<rasputin
  include Friend
end
rasputin.listen

cat = Cat.new('Cat')
begin
cat.listen
rescue => e
  puts "Hum #{e}"
end

