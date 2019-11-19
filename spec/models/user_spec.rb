require 'rails_helper'

RSpec.describe User, type: :model do
	it { should have_many(:messages) }
  it "is valid with valid attributes" do
  	user = User.new(username: "rachel", password: "rachel")
    expect(user).to be_valid
  end
  it "is not valid when missing username" do
  	user = User.new(password: "rachel")
    expect(user).to_not be_valid
  end
  it "is not valid when missing password" do
  	user = User.new(username: "rachel")
    expect(user).to_not be_valid
  end
  it "is not valid when password is too short" do
  	user = User.new(username: "rachel", password: "r")
    expect(user).to_not be_valid
  end
  it "is not valid when username is duplicated" do
  	user_1 = User.create(username: "rachel", password: "rachel")
  	user_2 = User.new(username: "rachel", password: "password")
    expect(user_2).to_not be_valid
  end
end
