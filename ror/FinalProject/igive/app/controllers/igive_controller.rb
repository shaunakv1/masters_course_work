class IgiveController < ApplicationController
  
  layout :fetch_layout
  
  def authenticate
    @user = User.new(params[:userform])
    valid_user = User.find(:first,:conditions => ["name = ? and password = ?",@user.name, @user.password])
    if valid_user
      session[:user_id]=valid_user.name
      redirect_to :action => 'home'
    else
      flash[:notice] = "Invalid User/Password"
      redirect_to :action=> 'login'
    end
  end
  
  def login
  end
  
  def home
    
    user= User.find_by_name(session[:user_id])
    @posted_items=@pending_dibs=Post.find_all_by_user_id_and_exchanged(user.id,false,:order => "created_at DESC")
    @pending_dibs=@pending_dibs.select{ |e| e.dibber >0 }   
    flash[:pending_message]= "<a href='/posts/pending_dibs'>Hey you have pending Dibs. Click Me!</a>" if (@pending_dibs.size>0)
    
    @accepted_dibs=Post.find_all_by_dibber_and_exchanged(user.id,true)
    flash[:accepted_message] ="<a href='/histories'>your dib was accepted. Click Me!</a>" if (@accepted_dibs.size>0)
    
    @dibbed_items = Post.find_all_by_dibber_and_exchanged(user.id, false,:order => "created_at DESC")
    
    if ( session[:coming_from] == "new_post")
      @new_post_marker = "'newentry'"
      session[:coming_from]= ""
    end
    
    if ( session[:coming_from] == "dib_item")
      @new_dib_marker = "'newdib'"
      session[:coming_from]= ""
    end
    
  end
  
  def populate_recent_posts
    user= User.find_by_name(session[:user_id])
    @recent_posts = Post.find(:all, :order => "created_at DESC", :limit => 10)
    @recent_posts = @recent_posts.select{ |e| e.user_id != user.id && e.dibber == 0}
    
    render :partial => 'layouts/recent_posts', :locals => {:recent_posts => @recent_posts}
  end
  
  def clear_notifications
    render :partial => 'blank'
  end
  
  def search
    
  end
  
  def logout
    if session[:user_id]
      reset_session 
      redirect_to :action=> 'login'
    end
  end
  
  
end
