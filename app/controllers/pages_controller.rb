class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home; end

  def dashboard
    @user = current_user
    @calendars = @user.calendars.all
    @events = policy_scope(Event).where(event: :calendar)
    @recruits = @user.recruits.all
  end
end
