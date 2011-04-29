class Employee
  def initialize(name)
    @name = name
  end
  def work(task)
    puts "#{@name} working on #{task}"
  end
end

class Manager < Employee
  def initialize(name)
    @level = 1
    super
  end
  
  def work(task)
    puts "sleep on it"
    super
  end
end

john = Employee.new('John')
puts john.inspect
john.work('something')

bob = Manager.new('Bob')
puts bob.inspect
bob.work('something')