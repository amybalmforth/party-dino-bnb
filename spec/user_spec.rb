require "data_mapper"
require "dm-postgres-adapter"

require 'user'
#
# describe "User" do
#
#   it "creates a new user" do
#     user1 = User.create(name: "John Smith", username: "johnsmith", email: "jsmith@gmail.com", password: "whatever")
#     user2 = User.create(name: "Jane Doe", username: "janedoe", email: "jdoe@gmail.com", password: "whatever2")
#
#     expect(user1.username).to eq("johnsmith")
#     expect(user2.password).to eq("whatever2")
#   end
#
#   it "does not allow user to log in if user not on database" do
#
#   end
# end

describe User do
  it { should have_property  :name }
  it { should have_property  :username }
  it { should have_property  :email }
  it { should have_property  :password }
end
