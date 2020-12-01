class EventController < ApplicationController
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
end
