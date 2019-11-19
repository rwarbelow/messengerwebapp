class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
	validates :body, length: { minimum: 1 }
	after_create_commit { MessageBroadcastJob.perform_now(self) }
end
