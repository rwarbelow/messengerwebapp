class ChatroomsController < ApplicationController
	before_action :require_logged_in_user 

	def index
		@chatroom = Chatroom.new
		@chatrooms = Chatroom.all
	end

	def show
		@chatroom = Chatroom.includes(:messages).find_by(id: params[:id])
	end

	def create
		chatroom = Chatroom.new(chatroom_params)
		if chatroom.save
			redirect_to chatrooms_path
		else
			flash[:negative] = chatroom.errors.full_messages.join(", ")
			redirect_to chatrooms_path
		end
	end

	def destroy
		chatroom = Chatroom.find(params[:id])

		if chatroom.default?
			flash[:negative] = "Default chatroom cannot be deleted"
		else
			chatroom.destroy
		end
		redirect_to chatrooms_path
	end

	private

	def require_logged_in_user
    redirect_to signin_path unless current_user
  end

  def chatroom_params
  	params.require(:chatroom).permit(:topic)
  end
end