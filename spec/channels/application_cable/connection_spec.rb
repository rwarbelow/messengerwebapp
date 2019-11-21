require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  it "successfully connects" do
    user = User.create(username: "rachel", password: "rachel")
    cookies.signed[:user_id] = user.id
    connect "/cable"
    expect(connection.current_user).to eq(user)
  end

  it "rejects connection" do
    expect { connect "/cable" }.to have_rejected_connection
  end
end