class ScheduleEventsController < ApplicationController
  before_action :schedule_event_params
  after_action :authorize_schedule_event

  def update
    @schedule_event = ScheduleEvent.find(params[:id])
    @user = User.find_by_first_name(schedule_event_params)
    @schedule_event.update(user: @user)
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
