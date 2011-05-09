require 'reading'
require 'serialport'

#params for serial port
port_str = "COM4"  #may be different for you
baud_rate = 57600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

puts "Starting.."
#just read forever
while true do
  reading = sp.read
  reading.strip!
 # puts "Raw:#{reading}|"

  if !reading.empty?
  	params = reading.split("|")
  	puts Time.now
  	puts "Temperature = #{params[0]}"
  	puts "Moisture = #{params[1]}"
  	puts "adding to db.."

  	reading = Reading.new
	reading.station_id = 1
	reading.temperature = params[0]
	reading.moisture = params[1]
	reading.created_at = Time.now + 5.hours
	reading.save
	puts "done.."
	puts "------------------------"
  end
  sleep 1.0
end

sp.close


