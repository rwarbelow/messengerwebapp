require 'rails_helper'

RSpec.feature "User sees all chatrooms" do
  scenario "when signed in" do
    room_1 = Chatroom.create(topic: "Potatoes")
    room_2 = Chatroom.create(topic: "Cheese")
    
    create_account_and_sign_in
   
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Let's Chat")
    within(".table") do
      expect(page).to have_content("Potatoes")
      expect(page).to have_content("Cheese")
    end
  end
end
