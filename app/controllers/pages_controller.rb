class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @team = current_user.team
    @schedule = @team.selected_schedule
    @events = @team.selected_schedule.events
    @recruits = @team.recruits.all

    @unavailable_day = UnavailableDay.new
    @unavailable_days = policy_scope(Event).order(created_at: :desc)
  end
end
