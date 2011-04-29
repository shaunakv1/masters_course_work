$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'active_record'
require 'dbinfo'

class Graduate < ActiveRecord::Base
  belongs_to :degree
  #belongs_to :faculty
  belongs_to :advisor, {:class_name => 'Faculty', :foreign_key => 'faculty_id'}
end
