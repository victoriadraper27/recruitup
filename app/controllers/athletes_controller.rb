class AthletesController < ApplicationController
  after_action :authorize_athlete, except: :index

  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
    @recruit = Recruit.new
  end

  private

  def authorize_wand
    authorize @athlete
  end

end
