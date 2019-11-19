class MessageBroadcastJob < ApplicationJob 
	queue_as :actioncableredis
 
  def perform(message) 
    ActionCable.server.broadcast("room#{message.chatroom_id}-messages", {template: create_html(message), roomID: message.chatroom_id})
  end 

  def create_html(message) 
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message }) 
  end 
end