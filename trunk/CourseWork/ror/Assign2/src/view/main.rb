$:.unshift File.dirname(__FILE__)
$:.unshift '..'
$:.unshift '../model'
$:.unshift '../config'


require 'yaml'
require 'book' 
require 'publisher'
require 'author'
require 'action'
require 'util'

class Main
  
  def initialize
    @@menu_map = YAML.load_file('src/config/menu.yml')
    menu_methods ={'main' => "Main Menu",'search' =>"Search Menu",'manage'=>"Manage Menu",'manage_authors'=>"Manage Authors Menu",'manage_books'=>"Manage Books Menu", 'manage_publishers'=>"Manage Publishers Menu"}
    menu_methods.keys.each {|key| self.class.send(:define_method, key){ show_menu(menu_methods[key])}}
    delete_methods = {'delete_author'=> "Author", 'delete_publisher'=> "Publisher", 'delete_book'=>"Book" }
    delete_methods.keys.each {|key| self.class.send(:define_method, key){ delete(delete_methods[key])}}
  end
  
  def start
    puts "********Welcome to LibPro********" 
    main
  end
  
  def show_menu(menu_title)
    menu = @@menu_map[menu_title]
    puts "\n\n-----#{menu_title}-------"
    menu.each_key {|e| puts "#{e}] #{humanize(menu[e])}"}
    print "select>"
    choice=gets.chomp.strip
    if (choice.to_i < 1 || choice.to_i > menu.keys.size )
      puts "Invalid Choice!"
      show_menu(menu_title)
    else
      send(menu[choice])
    end
  end
  
  def exit
    Process.exit
  end
  
  def list_all_books
    Util.display_list(Action.search_all_books)
    main
  end
  
  def search_by_author
    print "Enter authors last name:"
    last_name = gets.chomp.strip
    books =Action.search_all_books_by_author(last_name)
    if (books != nil)
      Util.display_list(books)
    else
      puts "No Books for this Author Found!"
    end
    main
  end
  
  def search_by_title
    print "Enter Partial Title Name :"
    books= Action.search_all_books_by_title(gets.chomp.strip)
    if (books != nil)
      Util.display_list(books)
    else
      puts "No Books with this title found!"
    end
    main
  end
  
  
  
  def create_author
    print "Enter authors name in 'FirstName<space>LastName' format ':"
    first_name,last_name = gets.chomp.strip.split
    Util.run_method_and_rescue_exceptions {Action.add_author(first_name,last_name)}
    main
  end
  
  def create_publisher
    print "Enter Publisher's Name :"
    Util.run_method_and_rescue_exceptions {Action.add_publisher(gets.chomp.strip)}
    main
  end
  
  def create_book (*args)
    update_id = 0
    action= ""
    
    if args.size == 0 
      action = 'create'
    else
      action = args[0]
      update_id = args[1]
    end
    
    print "Enter Title for Book :"
    title = gets.chomp.strip
    
    author_name=""
    authors=[]
    puts "Enter authors 'FirstName<space>LastName' format , enter # to stop :"
    
    until author_name == '#' 
      print "Enter Author: "
      author_name = gets.chomp.strip
      if  author_name.strip.empty? 
        print "Author Name cant be blank!"
        next
      end
      authors << author_name
    end 
    print "Enter Publisher's Name :"
    publisher_name=gets.chomp.strip
    authors.pop
    Util.run_method_and_rescue_exceptions {Action.add_book_by_names(title, authors, publisher_name,update_id,action)}
    main
  end
  
  
  
  def update_author
    selected_id =  Util.show_selection_module('Author','Update')
    puts "Enter the new first name:"
    first = gets.chomp.strip
    puts "Enter the new last name:"
    Util.run_method_and_rescue_exceptions {Action.update_author(selected_id,first, gets.chomp.strip)}
    main
  end
  
  def update_publisher
    selected_id = Util.show_selection_module('Publisher','Update')
    puts "Enter the New Name"
    Util.run_method_and_rescue_exceptions {Action.update_publisher(selected_id,gets.chomp.strip)}
    main
  end
  
  def update_book
    selected_id = Util.show_selection_module('Book','Update')
    book=Book.find(selected_id);
    puts "---Current Record:---"
    puts "Title: #{book.title}"
    puts "Publisher: #{book.publisher.name}"
    print "Author(s):" 
    book.authors.each {|e| print "#{e.first_name} #{e.last_name}|"}
    puts
    puts "---------------------"
    puts "Now the update filds"
    create_book("update",selected_id)
    main
  end
  
  def delete (model)
    selected_id = Util.show_selection_module(model,'Delete')
    Util.run_method_and_rescue_exceptions {Action.delete(model,selected_id)}
    main
  end
  
  def humanize(lower_case_and_underscored_word)
    lower_case_and_underscored_word.to_s.gsub(/_id$/, "").gsub(/_/, " ").capitalize
  end
end
