class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @team = @user.team
    @schedules = @team.schedules
    @schedule = @schedules.first
    # @schedule = @team.selected_schedule
    @schedule_event = ScheduleEvent.new
    @team = current_user.team
    # @schedule = @team.selected_schedule
    # @events = @team.selected_schedule.events
    @athletes = policy_scope(Athlete)
    @recruits = @team.recruits.all
    @unavailable_day = UnavailableDay.new
    @unavailable_days = policy_scope(Event).order(created_at: :desc)
  end
end
