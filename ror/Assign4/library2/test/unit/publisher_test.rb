require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  def setup
    @publisher = publishers(:one)
  end
  
  test "Create Publisher" do
    count = Publisher.count
    Publisher.create(:name => "Oreilly")
    assert_equal count+1, Publisher.count
  end
  
  test "Update Publisher" do
    @publisher.name = "Oreilly"
    assert @publisher.save!
  end
  
  test "Delete Publisher" do
    count = Publisher.count
    @publisher.delete
    assert_equal count-1, Publisher.count
  end
  
  test "publisher name cannot be blank" do
    @publisher.name = nil
    assert !@publisher.valid?
  end
  
  
  test "publisher name can consist of only alphabets" do
    @publisher.name = "12abc+de"
    assert !@publisher.valid?
  end
  
  test "publisher name length should be less than 15" do
    @publisher.name = "abcdefghijklmnopqrstu"
    assert !@publisher.valid?
  end
  
  test "publisher name is unique" do
    @publisher = Publisher.create(:name => "Tata")
    assert !@publisher.valid?
  end
  
end
