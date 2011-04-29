require 'net/http'
require 'rexml/document'
require "test/unit"
require "fetch_temperature"

class TemperatureTest < Test::Unit::TestCase
  
  def setup
    @temperature = FetchTemperature.new   
  end
  
  def test_self
    assert true
  end
  
  def test_read_woeids_from_file
    
    expected_woeids = []
    File.open "woeids.txt", "r" do |file|
      expected_woeids = file.readlines
    end
    actual_woeids = @temperature.read_woeids_from_file("woeids.txt");
    assert_equal(expected_woeids, actual_woeids)
  end
  
  def test_fetch_xml_for_woeid
    xml_data = @temperature.fetch_xml_for_woeid(2424766)
    assert_not_nil(xml_data) 
  end
  
  def test_parse_xml
    url = "http://weather.yahooapis.com/forecastrss?w=2424766&u=f"
    xml_data = Net::HTTP.get_response(URI.parse(url)).body 
    result = @temperature.parse_xml(xml_data);
    assert_equal("Houston", result[0])
  end
  
end