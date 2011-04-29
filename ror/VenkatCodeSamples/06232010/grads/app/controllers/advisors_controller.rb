class AdvisorsController < ApplicationController
  def display
    @year = params[:year] 
    @year ||= 2009

    @graduates = Graduate.find_all_by_year_of_graduation(@year)

    if @graduates.size < 1
      render :action => 'display_no_grads' 
    end
  end
end