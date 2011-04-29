class HistoriesController < ApplicationController
  # GET /histories
  # GET /histories.xml
  def index
    user = User.find_by_name(session[:user_id])
    @histories_of_posted = user.histories()
    @histories_of_received = History.find_all_by_receiver_id_and_action(user.id,"received",:order => "created_at DESC")
  end 
end
