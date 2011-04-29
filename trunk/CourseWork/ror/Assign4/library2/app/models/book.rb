class Book < ActiveRecord::Base
  belongs_to :publisher
  has_and_belongs_to_many :authors
  validates_presence_of :authors , :message => ":You need atleast one Author"
  validates_presence_of :publisher , :message => ":You need atleast one Publisher"
  validates_associated :publisher
  validates_presence_of :title, :message => ":This field cannot be blank"
  validates_length_of :title, :maximum => 20, :message= => "title lenght can be upto 20"
end
