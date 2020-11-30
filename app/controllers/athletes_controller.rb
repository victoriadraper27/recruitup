class AthletesController < ApplicationController
  def index
  end

  def show
    @athlete = Athlete.find(params[:id])
    @recruit = Recruit.new
  end
end
