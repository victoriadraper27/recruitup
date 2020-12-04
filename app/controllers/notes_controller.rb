class NotesController < ApplicationController
  after_action :authorize_note, except: :show

  def index
    @event = Event.find(parmas[:event_id])
    @notes = @event.notes.order(created_at: :desc)
  end

  def create
    @event = Event.find(params[:event_id])
    @note = Note.new(note_params)
    @note.user = current_user
    @note.event = @event

    if @note.save
      redirect_to event_path(@event)
    else
      render 'events/show'
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def note_params
    params.require(:note).permit(:content, :event_id)
  end

  def authorize_note
    authorize @note
  end
end
