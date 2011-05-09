class Reading < ActiveRecord::Base
	include ActionView::Helpers::DateHelper
	
	belongs_to :station

	def human_time
    	
     "#{time_ago_in_words(created_at.localtime)} ago"
    
	end

	def graph_time
    	
      created_at.localtime.strftime("%I:%M:%S %p")
    
	end

	def temp_in_f
	  ((temperature * 9)/ 5 + 32).round
    end
end
