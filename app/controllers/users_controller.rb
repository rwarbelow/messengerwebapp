class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:positive] = "Successful login"
      cookies.signed[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:negative] = @user.errors.full_messages.join(", ")
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end