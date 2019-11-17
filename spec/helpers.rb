module Helpers
  def create_account_and_sign_in
    user_attributes = {
      username: "rachel",
      password: "rachel"
    }

    visit '/signup'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Account"
  end
end