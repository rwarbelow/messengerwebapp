class Chatroom < ApplicationRecord
  validates :topic, presence: true, uniqueness: true
  has_many :messages, dependent: :destroy
  has_many :users, -> { distinct }, through: :messages
  after_create_commit { ChatroomBroadcastJob.perform_now(self) }

  def contributor_count
    users.count
  end

  def message_count
    messages.count
  end

  def default?
    topic == "Default"
  end
end
