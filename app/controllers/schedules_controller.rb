class SchedulesController < ApplicationController
  after_action :authorize_calendar, except: :index

  def index
    @schedules = policy_scope(Schedule).order(created_at: :desc)
  end

  def show
    @schedules = Schedule.find(params[:id])
  end

  #def edit
  #end

  # def update
  #en

  private

  def authorize_schedule
    authorize @schedule
  end
end
