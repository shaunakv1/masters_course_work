class User < ActiveRecord::Base
  has_many :posts
  has_many :histories
  has_many :messages
  
 validates_presence_of :name, :password,:email, :message => ":This field cannot be blank"
 validates_length_of :name, :password, :within => 4..15, :too_long => "pick a shorter name", :too_short => "pick a longer name"
 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
 validates_format_of :name, :with => /(?=.*([a-z]|[A-Z]))/
 validates_uniqueness_of :name, :message => "User with this name already exist"
 validates_uniqueness_of :email, :message => "User with this email already exist" 
end
