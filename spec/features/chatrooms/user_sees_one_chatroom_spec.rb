require 'rails_helper'

RSpec.feature "User sees one chatroom and its messages" do
  scenario "when signed in" do
    user_attributes = {
      username: "rachel",
      password: "rachel"
    }
    user = User.create(user_attributes)
    room_1 = Chatroom.create(topic: "Cheese")
    room_2 = Chatroom.create(topic: "Potatoes")
    message_1_body = "Gouda is delicious"
    message_2_body = "Let's eat French fries"
    room_1.messages.create(body: message_1_body, user: User.last)
    room_2.messages.create(body: message_2_body, user: User.last)

    sign_in_existing_user(user_attributes[:username], user_attributes[:password])

    click_on "Cheese"
    expect(page).to have_content("Cheese")
    expect(page).to have_selector(".event", count: 1)
    within(".event") do 
      expect(page).to have_content(message_1_body)
      expect(page).to_not have_content(message_2_body)
    end

    visit "/chatrooms/#{room_2.id}"
    expect(page).to have_content("Potatoes")
    expect(page).to have_selector(".event", count: 1)
    within(".event") do 
      expect(page).to have_content(message_2_body)
      expect(page).to_not have_content(message_1_body)
    end
  end
end
