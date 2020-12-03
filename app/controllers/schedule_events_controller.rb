class ScheduleEventsController < ApplicationController
  def update
    @schedule_event = ScheduleEvent.find(params[:id])
    @schedule_event.update(user: )
  end

  private

  def schedule_event_params
    params.require(:schedule_event).permit()
  end
end
