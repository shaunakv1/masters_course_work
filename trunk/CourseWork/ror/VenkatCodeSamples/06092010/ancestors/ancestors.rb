module MyModule1
end
module MyModule2
end
module MyModule3
end

class MyClass
end

obj = MyClass.new
puts obj.class
puts obj.class.superclass
puts obj.class.ancestors.join(', ')
MyClass.class_eval do
  include MyModule1
  include MyModule2
end
puts obj.class.ancestors.join(', ')

obj.extend MyModule3
puts obj.class.ancestors.join(', ')
#MyModule3 is added as a virtual class,
#so you don't see it in the ancestors list