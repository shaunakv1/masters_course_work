class Graduate < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :year_of_graduation
  validates_numericality_of :year_of_graduation, :in => [1927..4000]

  belongs_to :degree
end
