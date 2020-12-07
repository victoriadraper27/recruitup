class ScheduleEventsController < ApplicationController
  after_action :authorize_schedule_event

  def update
    @schedule_event = ScheduleEvent.find(params[:id])
    @user = User.find_by_first_name(schedule_event_params[:user])
    @schedule_event.update(user: @user)
    # render json: { status: 'ok' }
    redirect_to '/dashboard'
  end

  private

  def schedule_event_params
    params.require(:schedule_event).permit(:user)
  end

  def authorize_schedule_event
    authorize @schedule_event
  end
end
