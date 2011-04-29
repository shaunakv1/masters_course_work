require "fetch_temperature"

temperature_finder = FetchTemperature.new
temperature_finder.display_temperatures("woeids.txt").each {|e| puts e}