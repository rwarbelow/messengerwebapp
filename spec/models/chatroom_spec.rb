require 'rails_helper'

RSpec.describe Chatroom, type: :model do
	it { should have_many(:messages) }
  it "is valid with valid attributes" do
  	chatroom = Chatroom.new(topic: "Potatoes")
    expect(chatroom).to be_valid
  end
  it "is not valid when missing topic" do
  	chatroom = Chatroom.new
    expect(chatroom).to_not be_valid
  end
  it "is not valid when topic is duplicated" do
  	chatroom_1 = Chatroom.create(topic: "Potatoes")
  	chatroom_2 = Chatroom.new(topic: "Potatoes")
    expect(chatroom_2).to_not be_valid
  end
  it "calculates number of contributors and messages" do
  	chatroom_1 = Chatroom.create(topic: "Potatoes")
  	chatroom_2 = Chatroom.create(topic: "Denver")
  	user_1 = User.create(username: "rachel", password: "rachel")
  	user_2 = User.create(username: "eric", password: "eric")
  	user_1.messages.create(body: "This is great", chatroom: chatroom_1)
  	user_1.messages.create(body: "This is fantastic", chatroom: chatroom_1)
  	user_2.messages.create(body: "This is awesome", chatroom: chatroom_1)
  	user_1.messages.create(body: "This is good", chatroom: chatroom_2)

  	expect(chatroom_1.contributor_count).to eq(2)
  	expect(chatroom_2.contributor_count).to eq(1)
  	expect(chatroom_1.message_count).to eq(3)
  	expect(chatroom_2.message_count).to eq(1)
  end
end
