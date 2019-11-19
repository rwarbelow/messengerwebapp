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
end
