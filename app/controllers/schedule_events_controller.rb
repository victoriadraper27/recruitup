class ScheduleEventsController < ApplicationController
  before_action :schedule_event
  after_action :authorize_schedule_event
  def update
    @schedule_event = ScheduleEvent.find(params[:id])
    @schedule_event.update(schedule_event_params)
    redirect_to :back
  end

  private

  def schedule_event_params
    params.require(:schedule_event).permit(:user)
  end

  def authorize_schedule_event
    authorize @unavailable_day
  end
end
