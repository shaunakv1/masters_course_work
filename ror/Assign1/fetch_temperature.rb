require 'net/http'
require 'rexml/document'

class FetchTemperature
  
  def read_woeids_from_file(filename)
    
    File.open filename, "r" do |file|
      file.readlines
    end
  end
  
  def fetch_xml_for_woeid(woeid)
    url = "http://weather.yahooapis.com/forecastrss?w=#{woeid}&u=f"
    Net::HTTP.get_response(URI.parse(url)).body
  end
  
  def parse_xml(xml_data)
    doc = REXML::Document.new(xml_data)
    city = doc.elements["rss/channel/yweather:location"].attributes["city"]
    state = doc.elements["rss/channel/yweather:location"].attributes["region"]
    temperature = doc.elements["rss/channel/item/yweather:condition"].attributes["temp"]
    unit = doc.elements["rss/channel/yweather:units"].attributes["temperature"]
    return city, state, temperature, unit
  end
  
  def display_temperatures(file)
    results = []
    read_woeids_from_file(file).each do |woeid|
      xml = fetch_xml_for_woeid(woeid)
      result = parse_xml(xml)
      results << sprintf("%s, %-3s- %s%s", result[0],result[1],result[2],result[3])
    end
    results.sort 
  end
  
end
