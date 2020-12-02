class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @schedules = @user.schedules.all
    @events = policy_scope(Event).order(created_at: :desc)
    @recruits = @user.recruits.all
  end
end
