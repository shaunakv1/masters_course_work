class Car
  attr_reader :gas_level
  def initialize
    @gas_level = 100
  end
  def set_gas_level(level)
    @gas_level = level
  end
  
  def siphion(other)
    other.set_gas_level(0)
  end
end

car1 = Car.new
car2 = Car.new
puts car1.gas_level
# In ruby encapsulation is at the object level.
car2.siphion(car1)
puts car1.gas_level

#comment out the following and try
class Car
  private :set_gas_level
end

car2.siphion(car1)