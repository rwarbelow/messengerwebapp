require 'rails_helper'

RSpec.feature "User creates chatroom" do
  scenario "with valid attributes" do
    user_attributes = {
      username: "rachel",
      password: "rachel"
    }
    user = User.create(user_attributes)
    room = Chatroom.create(topic: "Cheese")

    sign_in_existing_user(user_attributes[:username], user_attributes[:password])

    new_topic = "Tomatoes"

    visit chatrooms_path
    within(".table") do 
      expect(page).to have_content(room.topic)
      expect(page).to_not have_content(new_topic)
    end

    fill_in "chatroom[topic]", with: new_topic
    click_on "create_chatroom"

    expect(Chatroom.count).to eq(2)
    expect(current_path).to eq(chatrooms_path)
    expect(page).to have_selector('tr.topic', count: 2)
    within(".table") do 
      expect(page).to have_content(new_topic)
    end
  end
end