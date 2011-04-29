class InvalidArgument < StandardError
end

def foo(number)
  if number == 0 
    raise InvalidArgument, "don't send me zero as parameter"
  end
  
  raise "don't send negative parameter" if number < 0
  
  number * 2
end

[0, -2, 4].each { |number| 
  begin
    puts foo(number)
  rescue InvalidArgument => e
    puts "oops Invalid eh? #{e}"
  rescue => e
    puts "oops #{e}"
  else
    puts "do this only if nothing messed up"
  ensure
    puts "will do this always"
  end
}
