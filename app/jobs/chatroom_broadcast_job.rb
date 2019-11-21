class ChatroomBroadcastJob < ApplicationJob 
  queue_as :chatroombroadcastjob
 
  def perform(chatroom) 
    ActionCable.server.broadcast("chatrooms", {template: create_html(chatroom)})
  end 

  def create_html(chatroom) 
    ApplicationController.renderer.render(partial: 'chatrooms/chatroom', locals: { chatroom: chatroom }) 
  end 
end