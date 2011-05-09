require 'reading'
require 'serialport'

 #params for serial port
  port_str = "COM3"  #may be different for you
  baud_rate = 57600
  data_bits = 8
  stop_bits = 1
  parity = SerialPort::NONE

  @@sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

def read_sp
  reading = ""
  check_time = Time.now+10.seconds
  while true do
    reading = @@sp.read
    
    if !reading.empty? #stop if input is received on serial port
      break
    end
    
    if Time.now >= check_time #stop reading after 20 seconds
      puts "no data received for the command.."
      break
    end    
  
  end
  
  reading.strip!
  reading
end

def start_collecting
 
  #$1#22#141@
  puts "Starting.."
  while true do
      
    @@sp.write "$#2#temp#moist@"
    sleep 1.0
    reading = read_sp
    puts "Raw:#{reading}"

    if !reading.empty?
    	reading.chop!
      reading.slice!(0)
      reading.slice!(0)
      params = reading.split("#")
      #puts "processed: 1:#{params[0]} 2:#{params[1]} 3: #{params[2]}"
      
    	puts Time.now
      puts "ID = #{params[0]}"    
    	puts "Temperature = #{params[1]}"
    	puts "Moisture = #{params[2]}"
    	puts "adding to db.."

      reading = Reading.new
    	reading.station_id = params[0]
    	reading.temperature = params[1]
    	reading.moisture = params[2]
    	reading.created_at = Time.now + 5.hours
    	reading.save
    	puts "done.."
    	puts "------------------------"
     end
    sleep 5.0
  end

  @@sp.close
  puts "Stopping.."
end

start_collecting

