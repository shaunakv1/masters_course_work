class Publisher < ActiveRecord::Base
  has_many :books
  validates_presence_of :name, :message => " :This field cannot be blank"
  validates_format_of :name, :with => /^[\sA-Za-z.]*\z/, :message => ": may contain only alphabets [A-Za-z]"
  validates_length_of :name, :maximum => 15, :message= => "Publisher Name can be upto 20 characters"
  validates_uniqueness_of :name, :message => "Publisher already exist"
end
