module MyModule
  def f1
    puts "f1 called"
  end
  def MyModule.f2
    puts "f2 called"
  end
end

class MyClass
  include MyModule
end

obj1 = MyClass.new
#instance methods of module
#get mixed in to your class
#as instance methods when you
#use include
obj1.f1

class MyClass2
  extend MyModule
end

obj2 = MyClass2.new
MyClass2.f1
#instance methods of module
# get mixed in to your class
# as class methods(static)
#when you use extend

#-----
#if you do extend on an instance,
#then the instance methods become instance methods

class MyClass3; end
obj3 = MyClass3.new
obj3.extend MyModule
obj3.f1

obj3a = MyClass3.new
begin
  obj3a.f1
rescue => e
  puts "error: #{e}"
end