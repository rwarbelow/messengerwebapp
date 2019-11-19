module Helpers
  def create_account_and_sign_in
    user_attributes = {
      username: "rachel",
      password: "rachel"
    }

    visit '/signup'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "create_account"
  end

  def sign_in_existing_user
  	user   = User.create(username: "rachel", password: "rachel")
  	visit '/signin'
  	fill_in "session[username]", with: user_attributes[:username]
    fill_in "session[password]", with: user_attributes[:password]
    click_on "create_account"
  end
end