# class User
#
#   attr_reader :id, :name, :username, :email, :password
#
#   def initialize(id:, name:, username:, email:, password:)
#     @id = id
#     @name = name
#     @username = username
#     @email = email
#     @password = password
#   end
#
#   def self.create(name:, username:, email:, password:)
#     if ENV['ENVIRONMENT'] == 'test'
#       conn = PG.connect(dbname: 'party_dino_bnb_test')
#     else
#       conn = PG.connect(dbname: 'party_dino_bnb')
#     end
#
#     result = conn.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name, username, email, password")
#     User.new(id: result[0]['id'], name: result[0]["name"], username: result[0]["username"], email: result[0]["email"], password: result[0]["password"])
#   end
#
#   def self.find(column, value)
#     if ENV['ENVIRONMENT'] == 'test'
#       conn = PG.connect(dbname: 'party_dino_bnb_test')
#     else
#       conn = PG.connect(dbname: 'party_dino_bnb')
#     end
#
#     result = conn.exec("SELECT * FROM users WHERE #{column} = '#{value}'")
#     res = result.map do |row|
#       User.new(id: row["id"], name: row["name"], username: row["username"], email: row["email"], password: row["password"])
#     end
#     search_result = res[0]
#   end
#
# end

require "data_mapper"
require "dm-postgres-adapter"
require "dm-rspec"

class User
  include DataMapper::Resource

  property :id,             Serial
  property :name,           String
  property :username,       String
  property :email,          String
  property :password,       String

end
