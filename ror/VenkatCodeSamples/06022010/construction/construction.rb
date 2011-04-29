class Car
  attr_reader :miles
  def initialize()
    @miles = 0
  end
  
  def drive(dist)
    @miles += dist
  end
end

car = Car.new
car.drive(10)
puts car.miles