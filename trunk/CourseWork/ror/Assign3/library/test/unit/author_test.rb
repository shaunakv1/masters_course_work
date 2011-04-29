require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  def setup
    @author = authors(:sv)
  end
  
  test "Create Author" do
    count = Author.count
    Author.create(:first_name => "Venkat", :last_name => 'Subaramanium')
    assert_equal count+1, Author.count
    end
    
  test "Update Author" do
    @author.first_name = "Venkat"
    assert @author.save!
  end

  test "Delete Author" do
    count = Author.count
    @author.delete
    assert_equal count-1, Author.count
  end
  
  test "author requires first name" do
    @author.first_name = nil
    assert !@author.valid?
  end
  
  test "author requires last name" do
    @author.last_name = ""
    assert !@author.valid?
  end
  
  
  test "only alphabets in the first name" do
    @author.first_name = "12abc+de"
    assert !@author.valid?
  end
  
  test "only alphabets in the last name" do
    @author.last_name = "12abc+de"
    assert !@author.valid?
  end
  
  test "first name length should be less than 15" do
    @author.first_name = "abcdefghijklmnopqrstu"
    assert !@author.valid?
  end
  
  test "last name length should be less than 15" do
    @author.last_name = "abcdefghijklmnopqrstu"
    assert !@author.valid?
  end
  
  test "returning authors first and last name" do
     assert_equal "Shaunak Vairagare", @author.display_name
   end
  
end
