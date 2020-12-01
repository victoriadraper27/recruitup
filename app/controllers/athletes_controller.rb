class AthletesController < ApplicationController
  after_action :authorize_athlete, except: :index

  def index
    @athletes = policy_scope(Athlete).order(created_at: :desc)
    @athletes = Athlete.search(params[:query]) if params[:query].present?
  end

  def show
    @athlete = Athlete.find(params[:id])
    @recruit = Recruit.new
  end

  private

  def authorize_athlete
    authorize @athlete
  end
end
