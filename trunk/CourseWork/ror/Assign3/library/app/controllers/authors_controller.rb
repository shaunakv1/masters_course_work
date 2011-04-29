class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.xml
  def index
    @authors = Author.all
    flash[:notice] = "No Authors Added Yet"  if (@authors.size == 0)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authors }
    end
  end

  # GET /authors/1
  # GET /authors/1.xml
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @author }
    end
  end
  
  def show_books_of_author
    @author = Author.find(params[:id])
    @books = @author.books
    flash[:notice] = 'Sorry No books found..'if (@books.size ==0 || @books == nil)
  end

  # GET /authors/new
  # GET /authors/new.xml
  def new
    @author = Author.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @author }
    end
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors
  # POST /authors.xml
  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if @author.save
        flash[:notice] = 'Author was successfully created.'
        format.html { redirect_to(@author) }
        format.xml  { render :xml => @author, :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        flash[:notice] = 'Author was successfully updated.'
        format.html { redirect_to(@author) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.xml
  def destroy
    @author = Author.find(params[:id])
    if @author.books.size ==0 || @author.books==nil
      @author.destroy
      respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
      end
   else
      respond_to do |format|
      flash[:notice] = "Author cannot be deleted, since the book exists"
      format.html{redirect_to(@author)}
      format.xml  { head :ok }
    end
  end
end
 
end
