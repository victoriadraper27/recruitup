class AthletesController < ApplicationController
  def index
    if params[:query].present?
      @athletes = Athlete.search(params[:query])
    else
      @athletes = Athlete.all
    end
  end

  def show
    @athlete = Athlete.find(params[:id])
    @recruit = Recruit.new
  end
end
