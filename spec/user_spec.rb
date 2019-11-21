require 'user'

describe "User" do

  it "creates a new user" do
    user1 = User.create(name: "John Smith", username: "johnsmith", email: "jsmith@gmail.com", password: "whatever")
    user2 = User.create(name: "Jane Doe", username: "janedoe", email: "jdoe@gmail.com", password: "whatever2")

    expect(user1.username).to eq("johnsmith")
    expect(user2.password).to eq("whatever2")
  end

end
