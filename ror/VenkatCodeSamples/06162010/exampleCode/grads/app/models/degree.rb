class Degree < ActiveRecord::Base
  validates_presence_of :name, :title, :years
  validates_inclusion_of :years, :in => [2, 4, 6]
end
