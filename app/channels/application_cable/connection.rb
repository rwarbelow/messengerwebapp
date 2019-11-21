module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_logged_in_user
    end

    def find_logged_in_user
      current_user = User.find_by(id: cookies.signed[:user_id])
      if current_user
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end