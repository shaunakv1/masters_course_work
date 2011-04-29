require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  fixtures :posts
  
  def setup
    @user = users(:one)
    @post = posts(:one)
  end
  
  test "Create user" do
    count = User.count  
    @user = User.new
    @user.name = "nams"
    @user.password = "gons"
    @user.email = "nams@gmail.com"
    @user.save
    assert_equal count+1, User.count
  end  
  
  test "Update user name" do
    @user.name = "Vasun"
    assert @user.save!
  end
  
  test "Update user password" do
    @user.password = "vasu"
    assert @user.save!
  end
  
  test "Update user e-mail" do
    @user.email = "vasundhara@gmail.com"
    assert @user.save!
  end
  
  test "Delete user" do
    count = User.count
    @user.delete
    assert_equal count-1, User.count
  end
  
  test "name cannot be blank" do
    @user.name = nil
    assert !@user.valid?   
  end
  
  test "password cannot be blank" do
    @user.password = nil
    assert !@user.valid?   
  end
  
  test "e-mail cannot be blank" do
    @user.email = nil
    assert !@user.valid?   
  end
  
  test "name length should be less than 15" do
    @user.name = "abcdefghijklmnopqrstu"
    assert !@user.valid?
  end
  
  test "name length should be greater than 3" do
    @user.name = "abc"
    assert !@user.valid?
  end
  
  test "password length should be greater than 3" do
    @user.password = "abc"
    assert !@user.valid?
  end
  
  test "password length should be less than 15" do
    @user.password = "abcdefghijklmnopqrstu"
    assert !@user.valid?
  end
  
  test "email invalid format" do
    @user.email = ".123...@gmacom"
    assert !@user.valid?
  end
  
  test "name should contain alphabets" do
    @user.name = "...123."
    assert !@user.valid?
  end
  
  
  test " name is unique" do
    @user = User.new
    @user.name = "Shaun"
    assert !@user.valid?
  end
  
  
  test "email is unique" do
    @user = User.new
    @user.email =  "shaunakv1@gmail.com"
    assert !@user.valid?
  end  
  
end
