class AthletesController < ApplicationController
  after_action :authorize_athlete, except: :index

  def index
    @athletes = policy_scope(Athlete).order(created_at: :desc)
    @athletes = Athlete.search(params[:query]) if params[:query].present?
    chat_id = current_user.team.chatroom_id
    @chatroom = Chatroom.find_by_id(chat_id)
    @message = Message.new
    @athlete = Athlete.new
  end

  def show
    @athlete = Athlete.find(params[:id])
    @recruit = Recruit.new
    chat_id = current_user.team.chatroom_id
    @chatroom = Chatroom.find_by_id(chat_id)
    @message = Message.new
  end

  private

  def authorize_athlete
    authorize @athlete
  end

  def athlete_params
    params.require(:athlete).permit(:photo)
  end
end
