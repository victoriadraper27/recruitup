class RecruitsController < ApplicationController
  before_action :set_recruit, only: :destroy
  after_action :authorize_recruit, except: :index

  def index
    @recruits = policy_scope(Recruit).order(created_at: :desc)
  end

  # def show; end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @recruit = Recruit.new
    @recruit.athlete = @athlete

    if @recruit.save
      redirect_to recruits_path
    else
      render 'athletes/show'
    end
  end

  def destroy; end

  # def edit; end

  # def update
  # end

  private

  def set_recruit
    @recruit = Recruit.find(params[:id])
  end

  def authorize_recruit
    authorize @recruit
  end
end
