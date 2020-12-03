class SchedulesController < ApplicationController
  after_action :authorize_schedule, except: :index

  def index
    @schedules = policy_scope(Schedule).order(created_at: :desc)
  end

  def show
    @schedule = Schedule.find(params[:id])
    @events = policy_scope(Event)
  end

  def select
    @schedule = Schedule.find(params[:id])
    current_user.selected_schedule = @schedule
    if current_user.save
      redirect_to dashboard_path
    else
      render :show
    end
  end

  # def edit
  # end

  # def update
  # end

  private

  def authorize_schedule
    authorize @schedule
  end
end
