require 'rails_helper'

require 'rails_helper'

RSpec.feature "User signs in" do
  scenario "with existing account" do
  	user_attributes = {
      username: "rachel",
      password: "rachel"
    }
    
    user = User.create(user_attributes)

    visit '/signin'
    fill_in "session[username]", with: user_attributes[:username]
    fill_in "session[password]", with: user_attributes[:password]
    click_on "Sign in"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Successful login")
  end
end
