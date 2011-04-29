require 'book' 
require 'publisher'
require 'author'
require 'action'

class Util
   def self.run_method_and_rescue_exceptions
    begin
      yield
      puts "\n Action Successful!"
    rescue Exception =>e
      puts "\n Action Failed, error was:#{e}" 
    end
  end
    
  def self.display_list (collection)
    if collection.empty? || collection==nil 
      puts "No results found." 
    else
      format="\n %s"
      col_names=["' '"]
      collection[0].class.content_columns.each {|e| col_names << "'"+e.human_name+"'" ; format +=" %-15s"}
      print_func="printf(format,"
      print_func+= col_names.join(',') + ")"
      eval(print_func)
      count =0;
      collection.each do |item|
        count+=1
        col_values=[count.to_s]
        print_func="printf(format,"
        item.class.content_columns.each {|column| col_values << "'"+item.send(column.name.to_sym)+"'" }
        print_func+= col_values.join(',') + ")"
        eval(print_func)
      end
    end
  end
  
  def self.show_selection_module(model,action)
    puts "List of #{model}s \n"
    results=Action.search_all(model)
    display_list(results);
    print "\nSelect Index of #{model} to #{action}>"
    index = gets.chomp.to_i
    if (index < 1 || index > results.size )
      puts "Invalid Choice!"
      show_selection_module(model,action)
    else
      results[index - 1].id
    end
  end
  
end