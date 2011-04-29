class BooksController < ApplicationController
  
  def search
    search_string = params[:search][:query].strip
    @books=Book.find(:all,:conditions => 'title LIKE "%'+ search_string + '%"')
    flash[:notice] = 'Sorry No books found..'if (@books.size ==0 || @books == nil)
    render :partial => 'library/books', :locals => {:books => @books,:heading => "Search Result for '#{search_string}'" }
  end
  
  def show_book
    @book = Book.find(params[:id])
    render :partial => 'show', :locals => {:book => @book }
  end
  
  def create_new_form
    @book = Book.new
    render :partial => 'new', :locals => {:book => @book }
  end
  
  # GET /books/1/edit
  def edit_book_form
    @book = Book.find(params[:id])
    render :partial => 'new', :locals => {:book => @book, :heading => 'Edit Book' }
  end
  
  
  # POST /books
  # POST /books.xml
  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        format.html { render :partial => 'library/books', :locals => {:books => Book.all,:heading => "Books In Library" }}
      else
        format.html {render :partial => 'layouts/err', :locals => {:errors =>@book.errors } ,:status => 444}
      end
    end
  end
  
  # PUT /books/1
  # PUT /books/1.xml
  def update
    @book = Book.find(params[:id])
    
    respond_to do |format|
      if @book.update_attributes(params[:book])
        flash[:notice] = 'Book was successfully updated.'
        format.html { render :partial => 'library/books', :locals => {:books => Book.all,:heading => "Books In Library" }}
      else
        format.html {render :partial => 'layouts/err', :locals => {:errors =>@book.errors } ,:status => 444}
      end
    end
  end
  
  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    
    render :partial => 'library/books', :locals => {:books => Book.all,:heading => "Books In Library" }
  end
end
