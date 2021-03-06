class SchedulesController < ApplicationController
  after_action :authorize_schedule, except: :index

  def index
    @schedules = policy_scope(Schedule).order(created_at: :desc)
    @chatroom = current_user.team.chatroom
    @message = Message.new
  end

  def show
    @schedule = Schedule.find(params[:id])
    @events = policy_scope(Event)
    @chatroom = current_user.team.chatroom
    @message = Message.new
  end

  def select
    @schedule = Schedule.find(params[:id])

    current_user.team.selected_schedule = @schedule
    if current_user.team.save
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
