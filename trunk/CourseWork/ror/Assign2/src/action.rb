require 'book' 
require 'publisher'
require 'author'
class Action
  
  def self.search_all_books
    Book.find(:all, :order => 'title')
  end 
  
  def self.search_all_books_by_author(last_name)
    author=Author.find_by_last_name(last_name)
    author.books if author !=nil
  end
  
  def self.search_all_books_by_title(booktitle)
    Book.find(:all,:conditions => 'title LIKE "%'+ booktitle + '%"')
  end
  
  def self.search_all(model)
    model=Kernel.const_get(model)
    results = model.find(:all)
    results
  end
  
  def self.add_publisher(name)
    publisher=Publisher.new(:name => name)
    publisher.save!
    publisher
  end
  
  def self.add_author(first, last)
    author=Author.new(:first_name => first,:last_name => last)
    author.save!
    author
  end
  
  def self.add_book_by_names(title, author_names, publisher_name,id,action)
    raise RuntimeError.new("Book Title required")if title.strip.empty? 
    raise RuntimeError.new("Publisher required")if publisher_name.strip.empty? 
    raise RuntimeError.new("Author(s) required")if author_names.size==0
    author_names.each do |e|
      raise RuntimeError.new("Author(s) required") if e.strip.empty?
    end
    
    book= nil
    if(action == "create")
      book = Book.find_by_title(title)
      if book==nil
        book = Book.new(:title => title)  
      end
    else
      book = Book.find(id)
      book.authors = []
      book.title=title
    end
    
    publisher=Publisher.find_by_name(publisher_name)
    if publisher == nil
      publisher = add_publisher(publisher_name)
    end
    book.publisher = publisher
    
    author_names.each do |author_name|
      first_name , last_name = author_name.split
      author= Author.find_by_first_name_and_last_name(first_name , last_name)
      if author == nil
        author = add_author(first_name , last_name)
      end
      book.authors << author
    end
    
    book.authors.uniq!
    book.save!
  end
  
  def self.delete(model,value)
    result = eval("#{model}.find('#{value}')")
    raise RuntimeError.new("Cannot delete because books of this #{model} exist") if ((model=="Publisher" || model == "Author") && result.books.size > 0 ) 
    if (model== "Book")
      result.authors = []
      result.save!
    end
    result.delete
  end
  
  def self.update_publisher(id, name)
    publisher = Publisher.find_by_id(id)
    publisher.name = name
    publisher.save!
  end
  
  def self.update_author(id, first, last)
    author = Author.find_by_id(id)
    author.first_name = first
    author.last_name = last
    author.save!
  end
  
  def self.update_book(id, publisher_id, *author_ids)
    book = Book.find(id)
    book.publisher= Publisher.find(publisher_id);
    author_ids.each {|author_id| book.authors << Author.find(author_id)}
    book.authors.uniq!
    book.save!
  end
  
end

