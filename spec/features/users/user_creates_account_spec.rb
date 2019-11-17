require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "with valid attributes" do
    create_account_and_sign_in
    
    user = User.last

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful login")
  end
end
