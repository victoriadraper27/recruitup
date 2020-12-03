class NotesController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @note = Note.new
    @note.user = current_user
    @note.event = @event

    if @note.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
