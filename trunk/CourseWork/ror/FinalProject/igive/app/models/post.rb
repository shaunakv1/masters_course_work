class Post < ActiveRecord::Base
  has_one :history
  belongs_to :user
  has_many :messages
  
  validates_presence_of :title, :description,:tag, :message => ":This field cannot be blank"
  
  def dibber_name
    User.find(dibber).name
  end
  
  def dib_status
    status = "No Dibs"
    status = "Dibbed By #{dibber_name}" if (dibber >0 )
    status
  end
end
