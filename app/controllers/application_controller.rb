class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user?

  def current_user
    @user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end

  def current_user?
    !!current_user
  end
end
