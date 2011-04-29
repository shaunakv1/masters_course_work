require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  
  fixtures :publishers, :authors
  
  def setup
    @book = books(:one)
    @author = authors(:sv)
    @publisher = publishers(:one)
  end
  
  test "should show book" do
    post :show_book,:id => books(:one).to_param
    assert_template :partial => '_show'
  end
  
  test "should create new book form" do
    post :create_new_form
    assert_template :partial => '_new'
  end
  
  test "should create book" do
    assert_difference('Book.count') do
      post :create, :book => {:title =>"Ruby" , :author_ids => authors(:sv).to_param, :publisher_id => publishers(:one).to_param}
    end
  end
  
  test "should not create book " do
    post :create, :book => { }
    assert_template 'err'
  end
  
  
  test "search for a book" do
  post :search, :search => {:query => "rub"}
  assert_response :success
  assert_not_nil assigns(:books)
end

test "should edit book form" do
  post :edit_book_form, :id => books(:one).to_param
  assert_template ='new'
end


test "should update book" do
  put :update, :id => books(:one).to_param, :book => { }
  assert_template 'books'
end


test "should not update book" do
  put :update, :id => books(:one).to_param, :book => { :title => nil }
  assert_template 'err'
end

test "should destroy book" do
  assert_difference('Book.count', -1) do
    delete :destroy, :id => books(:one).to_param
  end
  
  assert_template :partial => '_books'
end

end
