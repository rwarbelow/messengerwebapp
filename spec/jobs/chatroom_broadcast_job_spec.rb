require "rails_helper"

RSpec.describe ChatroomBroadcastJob, :type => :job do
  describe "#perform" do
    it "renders a template" do
      ActiveJob::Base.queue_adapter = :test
      user = User.create(username: "rachel", password: "rachel")
      room = Chatroom.create(topic: "Food")
      expect {
        ChatroomBroadcastJob.perform_later(room)
      }.to have_enqueued_job
    end
  end
end
