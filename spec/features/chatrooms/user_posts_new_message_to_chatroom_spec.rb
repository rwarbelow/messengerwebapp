require 'rails_helper'

RSpec.feature "User posts a message to a chatroom" do
  scenario "with valid attributes", :js do
    user_attributes = {
      username: "rachel",
      password: "rachel"
    }
    user = User.create(user_attributes)
    room = Chatroom.create(topic: "Cheese")

    sign_in_existing_user(user_attributes[:username], user_attributes[:password])

    message = "Brie all day long"

    visit "/chatrooms/#{room.id}"
    fill_in "message[body]", with: message
    click_on "post_message"

    expect(current_path).to eq(chatroom_path(room))
    expect(page).to have_selector('.event', count: 1)
    expect(page).to have_content(message)
  end

  scenario "with no message body" do
    user_attributes = {
      username: "rachel",
      password: "rachel"
    }
    user = User.create(user_attributes)
    room = Chatroom.create(topic: "Cheese")

    sign_in_existing_user(user_attributes[:username], user_attributes[:password])

    message = ""

    visit "/chatrooms/#{room.id}"
    fill_in "message[body]", with: message
    click_on "post_message"

    expect(current_path).to eq(chatroom_path(room))
    expect(page).to have_selector('.event', count: 0)
    expect(page).to have_content("Body is too short")
  end
end
