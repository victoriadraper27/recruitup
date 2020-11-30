class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  # def edit
  # end

  # def update
  #end
end
