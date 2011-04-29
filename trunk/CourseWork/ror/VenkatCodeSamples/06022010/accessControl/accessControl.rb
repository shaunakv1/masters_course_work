class Car
  def tuneup
    puts 'turnup...called'
  end
  def fill_gas
    puts 'fill_gas called'
  end

  private :tuneup
end

car = Car.new
car.tuneup # will error now
car.fill_gas