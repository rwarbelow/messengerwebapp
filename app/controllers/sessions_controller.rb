class SessionsController < ApplicationController
	def new
	end

	def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:positive] = "Successful login"
      redirect_to root_path
    else
      flash[:negative] = "Username and/or password not recognized. Please try again."
      redirect_to root_path
    end
  end

	def destroy
		session.clear
    flash[:positive] = "Successful logout"
    redirect_to root_path
	end
end