require 'rubygems'
require 'active_record'
require 'dbinfo'

class Book < ActiveRecord::Base
  belongs_to :publisher
  has_and_belongs_to_many :authors
# validates_associated :publisher, :authors
  validates_presence_of :title, :message => ":This field cannot be blank"
  validates_length_of :title, :maximum => 20, :message= => "title lenght can be upto 20"
 end
