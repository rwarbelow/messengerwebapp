require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:chatroom) }
  
  it "is not valid when body is empty" do
  	chatroom = Chatroom.new(topic: "Denver")
  	user = User.new(username: "rachel", password: "rachel")
  	message = user.messages.new(body: "", chatroom: chatroom)
    expect(message).to_not be_valid
  end
end
