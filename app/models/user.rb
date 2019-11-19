class User < ApplicationRecord
	validates :username, presence: true, uniqueness: true
	validates :password, length: { minimum: 4 }
	has_many :messages, dependent: :destroy
	has_many :chatrooms, through: :messages
	has_secure_password
end
