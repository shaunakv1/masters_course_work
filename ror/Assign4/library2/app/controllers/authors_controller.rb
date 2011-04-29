class AuthorsController < ApplicationController
  
  
  # GET /authors/1
  # GET /authors/1.xml
  
  def show_books_of_author
    @author = Author.find(params[:id])
    @books = @author.books
    flash[:notice] = 'Sorry No books found..'if (@books.size ==0 || @books == nil)
    @publisher = Publisher.new
    render :partial => 'library/books', :locals => {:books => @books, :heading => "Books By #{@author.display_name}"}
  end
  
  def create_new_author_form
    @author = Author.new
    render :partial => 'new', :locals => {:author => @author, :heading => 'New Author' }
  end
  
  def edit_author_form
    @author = Author.find(params[:id])
    render :partial => 'new', :locals => {:author => @author, :heading => 'Edit Author' }
  end
  
  
  def create
    @author = Author.new(params[:author])
    flash[:notice] = ""
    respond_to do |format|
      if @author.save
        flash[:notice] = 'Author was successfully created.'
        format.html {render :partial => 'list', :locals => {:authors => Author.all}}
      else
        flash[:notice]= ""
        format.html {render :partial => 'layouts/err', :locals => {:errors =>@author.errors } ,:status => 444}
      end
    end
  end
  
  def update
    @author = Author.find(params[:id])
    respond_to do |format|
      if @author.update_attributes(params[:author])
        flash[:notice] = 'Author was successfully updated.'
        format.html {render :partial => 'list', :locals => {:authors => Author.all}}
      else
        flash[:notice]= ""
        format.html {render :partial => 'layouts/err', :locals => {:errors =>@author.errors } ,:status => 444}
      end
    end
  end
  
  def destroy
    @author = Author.find(params[:id])
    if @author.books.size ==0 || @author.books==nil
      @author.destroy
      flash[:notice] = 'Author was successfully destroyed.'
      render :partial => 'list', :locals => {:authors => Author.all}
    else
      errors = []
      flash[:notice] = "Author cannot be deleted, since the book exists"
      render :partial => 'layouts/err',:locals=> {:errors => errors},:status => 444 
      
    end
  end
  
  
end
