require "rails_helper"

RSpec.describe MessagesChannel, :type => :channel do
  it "successfully subscribes" do
    user = User.create(username: "rachel", password: "rachel")
    stub_connection current_user: user
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription.current_user).to eq(user)
  end
end