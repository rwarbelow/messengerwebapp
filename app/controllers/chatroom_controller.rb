class ChatroomController < ApplicationController
	before_action :require_logged_in_user 

	def index
	end

	private

	def require_logged_in_user
    if !current_user
    	redirect_to signin_path
    end
  end
end