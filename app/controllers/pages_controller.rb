class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @team = @user.team
    @schedules = @team.schedules
    @events = policy_scope(Event).order(created_at: :desc)
    @recruits = @team.recruits
    @unavailable_day = UnavailableDay.new
    @unavailable_days = policy_scope(Event).order(created_at: :desc)
  end
end
