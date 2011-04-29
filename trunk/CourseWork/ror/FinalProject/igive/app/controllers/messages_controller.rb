class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.xml
  require 'tlsmail'
  require 'time'
  
  after_filter :send_email_notification, :only => [:create,:reply]
  
  
  def index
    user=User.find_by_name(session[:user_id])
    
    @messages = Message.find(:all, :order => "created_at DESC")
    @messages=@messages.select {|m| m.user == user}
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end
  
  def show_message
    @message = Message.find(params[:id])
    sender = User.find(@message.sender_id)
    render :partial => 'message', :locals => {:message => @message , :sender => sender}
  end
  
  def show_reply_box
    user=User.find_by_name(session[:user_id])
    previous_message = Message.find(params[:id])
    
    @message = Message.new
    @message.subject = "Re: #{previous_message.subject}"
    @message.sender_id = user.id
    @message.user = User.find(previous_message.sender_id)
    @message.post = previous_message.post
    render :partial => 'reply_box', :locals => {:message => @message}
  end
  
  
  
  # GET /messages/new
  # GET /messages/new.xml
  def new
    @post = Post.find(params[:post_id])
    user = User.find_by_name(session[:user_id])
    @post.dibber = user.id
    @post.save
    
    @message = Message.new
    @message.subject = "Dib on your #{@post.title}"
    @message.sender_id =  user.id
    @message.user = User.find(@post.user_id)
    @message.post = @post
  end
  
  def create
    
    @message = Message.new(params[:message])
    if @message.save
      flash[:notice] = 'You have successfully placed your dib.'
      session[:coming_from] = "dib_item"
      redirect_to :action => "home" , :controller => 'igive'
    end
  end
  
  def reply 
    @message = Message.new(params[:message])
    @message.save
    flash[:reply_notice] = 'Your reply was sent successfully!'
    render :partial => 'notify'
  end
  
  def send_email_notification
    
    receiver_email = @message.user.email
    
    content = "You have a new message in your inbox!"
    puts "sending mail....."
    Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
    Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', "igive.mail@gmail.com", 'vasundhara', :login) do |smtp|
      smtp.send_message(content, "igive.mail@gmail.com", receiver_email)
    end
    puts "mail Sent!!"
  end
  
end
