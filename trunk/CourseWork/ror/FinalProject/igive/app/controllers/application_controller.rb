# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :check_user_logged_in, :except => [:login,:authenticate, :logout , :new, :create] 
  before_filter :populate_fields_always_required, :except => [:login,:authenticate,:logout]
  
  
  def check_user_logged_in
    if !session[:user_id]
      redirect_to :action=> 'login', :controller=> 'igive'
    end
    @recent_posts = nil
  end
  
  def fetch_layout
    layout = "application"
    layout= "login" if !session[:user_id]
    layout
  end
  
  def populate_fields_always_required
    if(session[:user_id])
      user= User.find_by_name(session[:user_id])
      @recent_posts = Post.find(:all, :order => "created_at DESC", :limit => 10)
      @recent_posts = @recent_posts.select{ |e| e.user_id != user.id && e.dibber == 0}
      
      user= User.find_by_name(session[:user_id])
      @messages=Message.find_all_by_user_id(user.id);
      flash[:new_mail_message] = "<a href='/messages'>You have Messages in Inbox. Click Me!</a>" if (@messages.size>0)
      @inbox_icon = "Inbox"
      @inbox_icon = "Inbox(#{@messages.size})" if (@messages.size > 0)
    end
  end
end
