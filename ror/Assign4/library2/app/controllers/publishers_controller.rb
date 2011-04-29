class PublishersController < ApplicationController
  
  def show_books_of_publisher
    @publisher = Publisher.find(params[:id])
    @books = @publisher.books
    flash[:notice] = 'Sorry No books found..'if (@books.size ==0 || @books == nil)
    @author= Author.new
    render :partial => 'library/books', :locals => {:books => @books, :heading => "Books By #{@publisher.name}"}
  end
  
  def create_new_publisher_form
    @publisher = Publisher.new
    render :partial => 'new', :locals => {:publisher => @publisher, :heading =>"New Publisher" }
  end
  
  # POST /publishers
  # POST /publishers.xml
  def create
    @publisher = Publisher.new(params[:publisher])
    respond_to do |format|
      if @publisher.save
        flash[:notice] = 'Publisher was successfully created.'         
        format.html {render :partial => 'list', :locals => {:publishers => Publisher.all}}
      else
        flash[:notice]= ""
        format.html {render :partial => 'layouts/err', :locals => {:errors =>@publisher.errors } ,:status => 444}
      end
    end
  end
  
  def edit_publisher_form
    @publisher = Publisher.find(params[:id])
    render :partial => 'new', :locals => {:publisher => @publisher, :heading =>"Edit Publisher" }
  end
  
  def update
    @publisher = Publisher.find(params[:id])
    respond_to do |format|
      if @publisher.update_attributes(params[:publisher])
        flash[:notice] = 'Publisher was successfully updated.'
        format.html {render :partial => 'list', :locals => {:publishers => Publisher.all}}
        
      else
        flash[:notice]= ""
        format.html {render :partial => 'layouts/err', :locals => {:errors =>@publisher.errors } ,:status => 444}
      end
    end
  end
  
  # DELETE /publishers/1
  # DELETE /publishers/1.xml
  def destroy
    @publisher = Publisher.find(params[:id])
    
    if @publisher.books.size ==0 || @publisher.books==nil
      @publisher.destroy
      flash[:notice] = 'Publisher was successfully destroyed.'
      render :partial => 'list', :locals => {:publishers => Publisher.all}
    else
      errors = []
      flash[:notice] = "Publisher cannot be deleted, since the book exists"
      render :partial => 'layouts/err',:locals=> {:errors => errors} ,:status => 444 
    end
  end
end
