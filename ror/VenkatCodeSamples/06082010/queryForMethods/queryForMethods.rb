class Human
  def listen
    puts 'Human listening...'
  end
end

class Dog
  def listen
    puts 'Dog listening...'
  end
end

class Cat; end

def use_if_present(friend)
  friend.listen if friend.respond_to? :listen
end

use_if_present Human.new
use_if_present Dog.new
use_if_present Cat.new