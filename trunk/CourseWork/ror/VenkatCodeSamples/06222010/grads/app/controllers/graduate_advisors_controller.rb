class GraduateAdvisorsController < ApplicationController
  def disp
    @year = params[:year] 
    @year ||= 2009

    @graduates = Graduate.find_all_by_year_of_graduation(@year)
  end
end