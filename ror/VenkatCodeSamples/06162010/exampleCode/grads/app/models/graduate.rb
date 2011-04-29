class Graduate < ActiveRecord::Base
  belongs_to :degree
  
  validates_presence_of :first_name, :last_name, :year_of_graduation, :degree
  validates_inclusion_of :year_of_graduation, :in => 1927..4000
end
