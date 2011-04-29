class Car
  attr_reader :miles, :year
  def drive(dist)
    @miles = 0 if @miles == nil
    @miles += dist
  end
end

car = Car.new
puts car.inspect
puts "creation on instance variable was deferred!!"
car.drive(10)
puts car.inspect
puts car.miles
car.drive(15)
puts car.miles