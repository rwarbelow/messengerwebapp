class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
	validates :body, length: { minimum: 1 }
end
