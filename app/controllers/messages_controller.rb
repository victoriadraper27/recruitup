class MessagesController < ApplicationController
  def create
    # @chatroom = Chatroom.find(params[:chatroom_id])
    @chatroom = current_user.team.chatroom
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
      # redirect_to back_with_anchor(anchor: "message-#{@message.id}")
      redirect_to request.referrer
    else
      # redirect_to back_with_anchor(anchor: "message-#{@message.id}")
      redirect_to request.referrer
      # render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  # def back_with_anchor(anchor: '')
  #   "#{request.referrer}##{anchor}"
  # end
end
