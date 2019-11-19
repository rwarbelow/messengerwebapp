class MessagesChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "room#{params['room']}-messages"
  end

  def receive(data)
    current_user.messages.create(body: data["messageBody"], chatroom_id: params["room"])
  end
end 