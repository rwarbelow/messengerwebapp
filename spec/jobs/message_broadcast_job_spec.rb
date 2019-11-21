require "rails_helper"

RSpec.describe MessageBroadcastJob, :type => :job do
  describe "#perform" do
    it "renders a template" do
      ActiveJob::Base.queue_adapter = :test
      user = User.create(username: "rachel", password: "rachel")
      room = Chatroom.create(topic: "Food")
      message = Message.create(body: "Pretzels", user: user, chatroom: room)
      expect {
        MessageBroadcastJob.perform_later(message)
      }.to have_enqueued_job
    end
  end
end
