module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_logged_in_user
    end

    def find_logged_in_user
      User.find_by(id: request.session[:user_id]) || reject_unauthorized_connection
    end
  end
end