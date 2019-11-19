class ChatroomsController < ApplicationController
	before_action :require_logged_in_user 

	def index
		@chatrooms = Chatroom.all
	end

	def show
		@chatroom = Chatroom.find(params[:id])
	end

	private

	def require_logged_in_user
    redirect_to signin_path unless current_user
  end
end