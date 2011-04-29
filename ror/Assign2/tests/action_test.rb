$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__),'..','src')
$:.unshift File.join(File.dirname(__FILE__),'..','src','model')
$:.unshift File.join(File.dirname(__FILE__),'..','src','config')

require "test/unit"
require "action"

class ActionTest < Test::Unit::TestCase
  
  def setup
    Book.connection.increment_open_transactions
    Book.connection.begin_db_transaction
  end
  
  def teardown
    Book.connection.rollback_db_transaction
  end
    
  def test_search_all_books
    actual=Book.find(:all, :order => 'title').size
    expected=Action.search_all_books.size
    assert_equal(actual,expected);
  end
  
  def test_search_all_books_by_author
    result=Action.search_all_books_by_author("Vairagare")
    assert_equal("Book of Music",result[0].title);
  end
  
  def test_search_all_books_by_title
    result=Action.search_all_books_by_title("Rub")
    assert_equal("Book of Ruby",result[0].title);
  end
  
  def test_search_all_authors
    actual=Author.find(:all).size
    expected=Action.search_all('Author').size
    assert_equal(actual,expected)
  end
  
  def test_search_all_publishers
    result=Publisher.find(:all)
    expected=result.length+1
    Action.add_publisher("Classic")
    result=Action.search_all('Publisher')
    actual = result.length
    assert_equal(actual,expected);
  end
  
  def test_add_author
    Action.add_author("Bjarne","Stroustrup")
    assert_equal("Bjarne",Author.find_by_last_name("Stroustrup").first_name)
  end  
  
  def test_add_publisher
    Action.add_publisher("O reilly")
    assert_equal("O reilly",Publisher.find_by_name("O reilly").name)
  end
  
  def test_update_author
    Action.update_author(3,"Vasu","Singh")
    assert_equal("Vasu",Author.find_by_last_name("Singh").first_name)
  end
  
  def test_update_publisher
    Action.update_publisher(1,"Tataaa")
    assert_equal("Tataaa",Publisher.find(1).name)
  end
  
  def test_delete_author
    Action.add_author("Author","ToDelete")
    author=Author.find_by_first_name('Author');
    Action.delete('Author',author.id)
    assert_equal(nil,Author.find_by_first_name("Author"))
  end
  
  def test_delete_publisher
    Action.add_publisher("Some Publisher")
    publisher=Publisher.find_by_name('Some Publisher')
    Action.delete('Publisher',publisher.id)
    assert_equal(nil,Publisher.find_by_name("Some Publisher"))
  end
  
  def test_unique_author_book_pair
    Action.add_book_by_names("Book1",[ "Tony Gates"," Tony Gates"], "Tata",0,"create")
    book=Book.find_by_title("Book1")
    assert_equal(1,book.authors.size)
  end
  
  def test_new_authors_not_added_for_repeated_entries_with_book
    Action.add_book_by_names("Book1",[ "Tony Gates"," Tony Gates"], "Tata",0,"create")
    authors=Author.find_all_by_first_name("Tony")
    assert_equal(1,authors.size)
  end
  
  def test_unique_publisher
    Action.add_publisher("publisher")
    assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_publisher("publisher")}
  end
  
  def test_publisher_cant_be_blank
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_publisher("")}
  end
  
  def test_publisher_can_have_just_alphabets
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_publisher("123asd(*&(*&^")}
  end
  
  def test_author_can_have_just_alphabets
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_author("12asd33(*&(*&^","1dd23")}
  end
  
  def test_author_first_name_cant_be_blank
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_author("","something")}
  end
  
   def test_author_last_name_cant_be_blank
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_author("something","")}
  end
  
  def test_add_book
      actual = Book.find(:all).size + 1
      Action.add_book_by_names("Book1",[ "Tony Gates"], "Tata",0,"create")
      expected = Book.find(:all).size
      assert_equal(actual,expected)
  end
  
  def test_update_book_title
      Action.add_book_by_names("Book Of Rails",[ "Tony Gates"], "Tata",1,"update")
      expected = Book.find(1).title
      assert_equal("Book Of Rails",expected)
  end
  
  def test_update_book_author
      Action.add_book_by_names("Book of Rails",[ "Venkat Subramaniam"], "Tata",0,"create")
      id=Book.find_by_title("Book of Rails").id
      Action.add_book_by_names("Book Of Rails",[ "Dave Thomas"], "Tata",id,"update")
      expected = Book.find(id).authors[0].first_name
      assert_equal("Dave",expected)
  end
  
  def test_delete_book
     Action.add_book_by_names("Book of Rails",[ "Venkat Subramaniam"], "Tata",0,"create")
     id=Book.find_by_title("Book of Rails").id
     actual = Book.find(:all).size - 1
     Action.delete("Book", id)
     expected = Book.find(:all).size
     assert_equal(actual,expected)
  end
  
  def test_book_name_cant_be_blank_while_creating
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_book_by_names("",[ "Tony Gates"," Tony Gates"], "Tata",0,"create")}
  end
  
  def test_book_name_cant_be_blank_while_upating
      assert_raise(ActiveRecord::RecordInvalid,RuntimeError) {Action.add_book_by_names("",[ "Tony Gates"," Tony Gates"], "Tata",1,"update")}
  end
  
  def test_donot_delete_author_if_book_exists
    Action.add_book_by_names("Book of Rails",[ "Venkat Subramaniam"], "Tata",0,"create")
    id = Author.find_by_first_name("Venkat").id   
    assert_raise(ActiveRecord::RecordInvalid,RuntimeError) { Action.delete('Author',id)}
  end
  
  def test_donot_delete_publisher_if_book_exists
    Action.add_book_by_names("Book of Rails",[ "Venkat Subramaniam"], "Tata",0,"create")
    id = Publisher.find_by_name("Tata").id   
    assert_raise(ActiveRecord::RecordInvalid,RuntimeError) { Action.delete('Publisher',id)}
  end
 
end