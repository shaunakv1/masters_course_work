str = 'hello'
puts str.empty?
puts str.succ
puts str
puts str.succ!
puts str

class Car
  def gasoline=(value)
    @gas = value
  end
end

car = Car.new
car.gasoline = 100
puts car.inspect