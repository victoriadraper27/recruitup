class RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :destroy]
  after_action :authorize_recruit, except: :index

  def index
    @recruits = policy_scope(Recruit).order(created_at: :desc)
  end

  def show
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])
    @recruits = policy_scope(Recruit).order(created_at: :desc)
    if @recruits.map { |recruit_hash| recruit_hash[:athlete] }.exclude?(@athlete)
      @recruit = Recruit.new
      @recruit.athlete = @athlete
      @recruit.team = current_user.team
      @recruit.save
      new_recruit_events_split(@recruit)
      redirect_to recruits_path
    else
      render 'athletes/show'
    end
  end

  def destroy
    @recruit.destroy
    redirect_to recruits_path
  end

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

  def new_recruit_events_split(recruit)
    schedule1 = current_user.team.schedules.first
    schedule2 = current_user.team.schedules.second
    ScheduleEvent.create(event: recruit.events.first, schedule: schedule1)
    ScheduleEvent.create(event: recruit.events.second, schedule: schedule1)
    ScheduleEvent.create(event: recruit.events.third, schedule: schedule1)
    ScheduleEvent.create(event: recruit.events.fourth, schedule: schedule2)
    ScheduleEvent.create(event: recruit.events.fifth, schedule: schedule2)
  end
end
