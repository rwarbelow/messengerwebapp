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

  def sign_in_existing_user(username, password)
    visit '/signin'
    fill_in "session[username]", with: username
    fill_in "session[password]", with: password
    click_on "Sign in"
  end
end