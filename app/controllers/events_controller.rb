class EventsController < ApplicationController
  after_action :authorize_event, except: :index

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @note = Note.new
    @notes = @event.notes.order(created_at: :desc)
    @athlete = policy_scope(Athlete).sample
    @schedules = current_user.team.schedules
    @schedule = current_user.team.selected_schedule || @schedules.first

    @marker = [{
      lat: @event.latitude,
      lng: @event.longitude
    }]
  end

  # def edit
  # end

  # def update
  # end

  private

  def authorize_event
    authorize @event
  end
end
