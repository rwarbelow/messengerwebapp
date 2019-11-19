require 'rails_helper'

RSpec.feature "User deletes chatroom" do
  scenario "and associated messages are removed" do
    room_1 = Chatroom.create(topic: "Potatoes")
    room_2 = Chatroom.create(topic: "Cheese")

    create_account_and_sign_in

    message_bodies = ["A message", "B message", "C message"]

    room_1.messages.create(user: User.last, body: message_bodies[0])
    room_1.messages.create(user: User.last, body: message_bodies[1])
    room_2.messages.create(user: User.last, body: message_bodies[2])

    expect(Message.count).to eq(message_bodies.count)
   
    Chatroom.all.each do |room|
      expect(page).to have_content(room.topic)
    end

    within(".table") do
      find("#delete-chatroom-#{room_1.id}").click
    end
    expect(page).to_not have_content(room_1.topic)
    expect(page).to have_content(room_2.topic)
    expect(Message.count).to eq(1)
  end

  scenario "but default chatroom cannot be deleted" do
    room_1 = Chatroom.create(topic: "Default")

    create_account_and_sign_in
    expect(page).to have_content(room_1.topic)

    expect(page).not_to have_selector("#delete-chatroom-#{room_1.id}")
  end
end
