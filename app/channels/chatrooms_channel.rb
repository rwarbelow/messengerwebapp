class ChatroomsChannel < ApplicationCable::Channel  
  def subscribed
    stream_from "chatrooms"
  end

  def receive(data)
    Chatroom.create(topic: data["topic"])
  end
end 