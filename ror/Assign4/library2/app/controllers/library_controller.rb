class LibraryController < ApplicationController
  def home
    @books = Book.find(:all, :order => 'title')
    @authors = Author.find(:all, :order => 'first_name')
    @publishers = Publisher.find(:all, :order => 'name')
    
    flash[:notice] = nil
    flash[:books_status] = nil
    flash[:authors_status] = nil
    flash[:publishers_status] = nil
    
    flash[:books_status] = "No Books In Library yet" if @books.size ==0
    flash[:authors_status] = "No Authors Created yet" if @authors.size ==0
    flash[:publishers_status] ="No Publishers Created yet" if @publishers.size ==0
    
    @author = Author.new
    @publisher= Publisher.new
    @book= Book.new
    @heading = "Books In Library"
  end
  
  def clear_notifications
    flash[:notice] = ""
    render :partial => 'blank'
  end
  
  
end
