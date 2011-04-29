require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  
  
  fixtures :publishers, :authors
  
  def setup
    @book = books(:one)
    @author = authors(:sv)
    @publisher = publishers(:one)
  end
  
  test "Create book" do
    count = Book.count  
    book =  Book.create(:title => "Perl")
    book.publisher = @publisher
    book.authors << @author
    book.save
    assert_equal count+1, Book.count
  end
  
  test "should not create due to author missing" do
    count = Book.count  
    book =  Book.create(:title => "Perl")
    book.publisher = @publisher
    book.authors []
    book.save
    assert_equal count, Book.count
  end
  
  test "should not create due to publisher missing" do
    count = Book.count  
    book =  Book.create(:title => "Perl")
    book.publisher = nil
    book.authors << @author
    book.save
    assert_equal count, Book.count
  end        
  
  test "Update book title" do
    @book.title = "perl"
    assert @book.save!
  end
  
  test "Update book's publisher" do
    @book.publisher.name = "Oreilly"
    assert @book.save!
  end
  
  test "Update book's author's name" do
    @book.authors << @author
    assert @book.save!
  end
  
  test "Delete book" do
    count = Book.count
    @book.delete
    assert_equal count-1, Book.count
  end
  
  test "book's title cannot be blank" do
    @book.title = nil
    assert !@book.valid?   
  end
  
  test "book's title length should be less than 15" do
    @book.title = "abcdefghijklmnopqrstu"
    assert !@book.valid?
  end  
end

