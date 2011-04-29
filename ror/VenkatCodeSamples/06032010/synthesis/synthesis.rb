map = {:Java => 'Goslin', :Ruby => 'Matz', 'C++' => 'Stroustrup'}

puts map
puts map[:Java]

Hash.class_eval do
  def method_missing(method_id, *args)
#    result = self[method_id]
#    result ||= self[method_id.to_s]
    
    self[method_id] || self[method_id.to_s]
  end
end

puts map.Ruby
puts map.inspect
str = 'inspect'
puts map.send(str)
puts map.send('Ruby')
puts map.send('C++')