# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

#  before_filter :check_user_logged_in, :except => [:login, :logout]
  
  def check_user_logged_in
    puts "****** checking if you logged in"
    redirect_to :controller => 'login', :action => 'login' if session[:user] == nil
  end

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
