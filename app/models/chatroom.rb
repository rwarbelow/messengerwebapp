class Chatroom < ApplicationRecord
	validates :topic, presence: true, uniqueness: true
	has_many :messages, dependent: :destroy
	has_many :users, through: :messages
end
