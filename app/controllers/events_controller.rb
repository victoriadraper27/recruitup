class EventsController < ApplicationController
  after_action :authorize_event, except: :index

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
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
