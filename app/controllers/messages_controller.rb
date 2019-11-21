class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)

    if @message.save
      redirect_to chatroom_path(@message.chatroom)
    else
      flash[:negative] = @message.errors.full_messages.join(", ")
      @chatroom = @message.chatroom
      redirect_to chatroom_path(@chatroom)
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :chatroom_id)
  end
end