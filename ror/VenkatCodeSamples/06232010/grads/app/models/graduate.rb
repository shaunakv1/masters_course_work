class Graduate < ActiveRecord::Base
  belongs_to :degree
  
  validates_presence_of :first_name
end
