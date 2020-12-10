class NotesController < ApplicationController
  after_action :authorize_note, except: [:index, :show]

  def index
    @notes = policy_scope(Note).order(created_at: :desc)
    @schedule = current_user.team.selected_schedule || current_user.team.schedules.first
    @schedule_events = @schedule.schedule_events
    @chatroom = current_user.team.chatroom
    @message = Message.new
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
