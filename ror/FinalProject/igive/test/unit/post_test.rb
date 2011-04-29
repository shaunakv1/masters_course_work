require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:one)
    @post = posts(:one)
  end
  
  
  test "Create post" do
    count = Post.count  
    post =  Post.create(:title => "laptop", :description => "brand new laptop", :tag =>"electronic", :user_id => 1, :dibber => 1, :exchanged =>"false" )
    assert_equal count+1, Post.count
  end  
  
  test "Update description" do
    @post.title = "brand new watch"
    assert @post.save!
  end
  
  test "Update title" do
    @post.title = "watch"
    assert @post.save!
  end
  
  test "Update tag" do
    @post.title = "watch"
    assert @post.save!
  end
  
  test "Update exchanged" do
    @post.title = "true"
    assert @post.save!
  end  
  
  test "Delete post" do
    count = Post.count
    @post.delete
    assert_equal count-1, Post.count
  end
  
  test "title cannot be blank" do
    @post.title = nil
    assert !@post.valid?   
  end
  
  test "description cannot be blank" do
    @post.description = nil
    assert !@post.valid?   
  end
  
  test "tag cannot be blank" do
    @post.tag = nil
    assert !@post.valid?   
  end
  
end
