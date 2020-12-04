class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @team = @user.team
    @schedules = @team.schedules
    @schedule = @schedules.first
    # @schedule = @team.selected_schedule
    @events = policy_scope(Event).order(created_at: :desc)
    @schedule_event = ScheduleEvent.new
    @unavailable_day = UnavailableDay.new
    @unavailable_days = policy_scope(Event).order(created_at: :desc)
  end
end
