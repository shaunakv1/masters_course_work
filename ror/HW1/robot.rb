class Robot
  
  def initialize
    @method_map = Hash.new
  end
  
  def learn_maneuvering(maneuver,&block)
    
    raise RuntimeError.new("no method block provided") if block==nil
    raise RuntimeError.new("Incorrect Method Name") if !validate_method_name(maneuver)
    
    @method_map[maneuver.to_sym]=block
  end 
  
  def method_missing(name, *args)
    raise RuntimeError.new("Unknown maneuver #{name}") if !@method_map.key?(name)
    block=@method_map[name]
    raise RuntimeError.new("Insufficiant Arguements passed") if args.length<block.arity
    block.call(*args)
    
  end
  
  def validate_method_name (method_name)
    if(method_name.chop=~/[^a-z_]/)!=nil 
      false
    else
      if (method_name[method_name.size-1,1]=~/[^a-z=\?!_]/) !=nil
        false
      else
        true
      end
    end
  end
  
end
