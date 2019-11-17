require 'rails_helper'

RSpec.feature "User logs out" do
  scenario "when already signed in" do
    create_account_and_sign_in
    
    user = User.last

    expect(current_path).to eq(root_path)

    click_on "Logout"
    expect(page).to_not have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful logout")
  end
end
