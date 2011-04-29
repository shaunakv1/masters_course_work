class PostsController < ApplicationController
  # auto_complete_for :post, :title
  def list
    search_string = params[:searchform][:query].strip
    user= User.find_by_name(session[:user_id])
    @posts=like_search(search_string) #Post.find(:all,:conditions => 'tag LIKE "%'+ search_string + '%"')
    @posts=@posts.select{ |e| e.user_id != user.id && e.dibber == 0}
    flash[:notice] = 'Sorry No posts found..' if (@posts.size ==0 || @posts == nil)
  end
  
  def like_search(query) 
    posts = Array.new
    tags = query.split
    tags.each do |tag| 
      posts += Post.find(:all,:conditions => 'tag LIKE "%'+ tag + '%"')
    end
    posts = posts.uniq
  end
  
  def pending_dibs
    user= User.find_by_name(session[:user_id])
    @pending_dibs=Post.find_all_by_user_id_and_exchanged(user.id,false)
    @pending_dibs=@pending_dibs.select{ |e| e.dibber >0 }
  end
  
  def sendMessage(subject, body, sender_id, user,post)
    message =  Message.new
    message.subject = subject
    message.body = body
    message.sender_id =  sender_id
    message.user = user
    message.post = post
    message.save
  end
  
  def accept_dib
    post =  Post.find(params[:id])
    post.exchanged = true
    post.save
    
    history = post.history
    history.receiver_id = post.dibber
    history.action = "received" 
    history.save     
    
    sendMessage("Dib Accepted",
                        "Your dib on #{post.title} has been accepted.", 
    User.find_by_name(session[:user_id]).id,
    User.find(post.dibber),post)
    
    redirect_to :action => "pending_dibs",  :controller => "posts"
  end
  
  def reject_dib
    post =  Post.find(params[:id])
    
    sendMessage("Dib Rejected", 
                "Sorry your dib on #{post.title} has been rejected.", 
    User.find_by_name(session[:user_id]).id,
    User.find(post.dibber),post)
    post.dibber = 0
    post.save
    redirect_to :action => "pending_dibs",  :controller => "posts"
  end
  
  def withdraw_dib
    @post = Post.find(params[:id])
    user = User.find_by_name(session[:user_id])
    @post.dibber = 0
    @post.save
    flash[:notice] = 'You have successfully removed your dib.'
    redirect_to :action => "home" , :controller => 'igive' 
  end
  
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end
  
  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @post.user=User.find_by_name(session[:user_id])
  end
  
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end
  
  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      
      
      if @post.save
        history = History.new
        history.title = @post.title
        history.description = @post.description
        history.user_id = User.find_by_name(session[:user_id]).id
        #history.receiver_id = 0
        history.action = "posted" 
        history.post = Post.find(@post.id)
        history.save
        
        flash[:notice] = 'Post was successfully created.'
        session[:coming_from] ="new_post"
        
        format.html { redirect_to(home_igive_url) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end