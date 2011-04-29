class Author < ActiveRecord::Base
  has_and_belongs_to_many :books 
  validates_length_of :first_name, :maximum => 15
  validates_length_of :last_name, :maximum => 15, :message= => "length should be less than {{count}}"
  validates_presence_of :first_name, :last_name, :message => " : This field cannot be blank"
  validates_format_of :first_name, :last_name, :with => /^[\sA-Za-z.]*\z/, :message => ": may contain only alphabets [A-Za-z]"
  
  def display_name
    "#{first_name} #{last_name}"
  end
  
end
