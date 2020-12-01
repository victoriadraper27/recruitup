class CalendarsController < ApplicationController
  after_action :authorize_calendar, except: :index

  def index
    @calendars = policy_scope(Calendar).order(created_at: :desc)
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  #def edit
  #end

  # def update
  #en

  private

  def authorize_calendar
    authorize @calendar
  end
end
