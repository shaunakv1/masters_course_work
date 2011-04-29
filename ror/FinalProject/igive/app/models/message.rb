class Message < ActiveRecord::Base
   
  belongs_to :user
  belongs_to :post
  
  def sender_name
    User.find(sender_id).name
  end
  
  def who_said (logged_user)
    user = User.find(sender_id)
    who = user.name
    who = "You" if (who == logged_user)
    who
  end
  
end
