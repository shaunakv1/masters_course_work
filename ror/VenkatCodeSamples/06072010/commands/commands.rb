module Kernel
  alias oldbacktick `
  
  def `(*args)
    response = <<-READUNTIL
You called!!!
#{oldbacktick *args}
Thanks for calling
READUNTIL
  end
end

puts `ls -l`