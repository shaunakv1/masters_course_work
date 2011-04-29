$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'active_record'
require 'dbinfo'

class Faculty < ActiveRecord::Base
  set_table_name :professors
end
