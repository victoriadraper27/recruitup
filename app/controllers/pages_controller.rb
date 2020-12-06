class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @team = @user.team
    @schedules = @team.schedules
    # @schedule = @schedules.first
    # @schedule = @team.selected_schedule
    @schedule_event = ScheduleEvent.new
    @team = current_user.team
    @schedule = @team.selected_schedule || @schedules.first
    # @events = @team.selected_schedule.events
    @event = @schedule.events.first
    @athletes = policy_scope(Athlete)
    @athlete = (policy_scope(Athlete).where(!policy_scope(Recruit))).sample
    @recruits = @team.recruits.all
    @unavailable_day = UnavailableDay.new
    @unavailable_days = policy_scope(Event).order(created_at: :desc)
  end
end
