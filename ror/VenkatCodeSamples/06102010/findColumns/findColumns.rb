require '../graduate'

Graduate.columns.each do |column|
  printf("%-20s%-20s%-20s\n", 
   column.name, column.human_name, column.type)
end