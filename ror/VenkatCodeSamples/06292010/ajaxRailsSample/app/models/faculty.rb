class Faculty < ActiveRecord::Base
  validates_presence_of :first_name, :message => "name is required"
end
